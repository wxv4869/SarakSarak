package org.sarak.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.sarak.domain.BookAttachVO;
import org.sarak.domain.BookSalesVO;
import org.sarak.domain.BookStockVO;
import org.sarak.domain.BookVO;
import org.sarak.domain.CartDTO;
import org.sarak.domain.Criteria;
import org.sarak.domain.MemberVO;
import org.sarak.domain.OrderCancelDTO;
import org.sarak.domain.OrderDTO;
import org.sarak.domain.OrderDetailDTO;
import org.sarak.domain.OrderPageItemDTO;
import org.sarak.mapper.BookAttachMapper;
import org.sarak.mapper.BookMapper;
import org.sarak.mapper.CartMapper;
import org.sarak.mapper.MemberMapper;
import org.sarak.mapper.OrderMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class OrderServiceImpl implements OrderService{

	@Setter(onMethod_ = @Autowired)
	private OrderMapper orderMapper;

	@Setter(onMethod_ = @Autowired)
	private BookAttachMapper attachMapper;

	@Setter(onMethod_ = @Autowired)
	private BookMapper bookMapper;

	@Setter(onMethod_ = @Autowired)
	private MemberMapper memberMapper;
	
	@Setter(onMethod_ = @Autowired)
	private CartMapper cartMapper;

	@Override
	public List<OrderPageItemDTO> getBooksInfo(List<OrderPageItemDTO> orders) {
		
		List<OrderPageItemDTO> result = new ArrayList<OrderPageItemDTO>();

		for(OrderPageItemDTO ord : orders) {
			
			OrderPageItemDTO booksInfo = orderMapper.getBooksInfo(ord.getBid());
			
			booksInfo.setBookCount(ord.getBookCount());
			
			booksInfo.setTotalPrice(booksInfo.initSaleTotal());
			
			List<BookAttachVO> attachList = attachMapper.findByBid(booksInfo.getBid());
			
			booksInfo.setAttachList(attachList);
			
			result.add(booksInfo);
		}

		return result;
	}

	@Override
	@Transactional
	public void order(OrderDTO ord) {
		
		/* 사용할 데이터 가져오기 */
		/* 회원 정보*/
		MemberVO member = memberMapper.read(ord.getMid());

		/* 주문 정보 */
		List<OrderDetailDTO> ords = new ArrayList<>();
		
		for(OrderDetailDTO odd : ord.getOrders()) {
		
			OrderDetailDTO orderDetail = orderMapper.getOrderInfo(odd.getBid());
			orderDetail.setOdetailquan(odd.getOdetailquan());
			orderDetail.initSaleTotal();
			ords.add(orderDetail);
			
		}

		ord.setOrders(ords);
		
		ord.getOrderPriceInfo();

		/* orderId만들기 및 OrderDTO객체 orderId에 저장 */
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("_yyyyMMddmm");
		String orderId = member.getMid() + format.format(date);
		ord.setOrderid(orderId);

		/* DB 주문, 주문 상품, 배송 정보 넣기 */ 
		orderMapper.enrollOrder(ord);
		for(OrderDetailDTO odd : ord.getOrders()) {
			
			odd.setOrderid(orderId);
			orderMapper.enrollOrderDetail(odd);
			
		}

		/* 재고, 판매량 변동 적용 */
		for(OrderDetailDTO odd : ord.getOrders()) {
			
			BookVO book = bookMapper.readmap(odd.getBid());
			int bid = book.getBid();
			BookStockVO stockvo = new BookStockVO();
			BookSalesVO salesvo = new BookSalesVO();
			int stock = book.getStock() - odd.getOdetailquan();
			int sales = book.getSales() + odd.getOdetailquan();
			log.info(book.getStock());
			stockvo.setBid(bid);
			stockvo.setStock(stock);
			salesvo.setBid(bid);
			salesvo.setSales(sales);

			orderMapper.deductStock(stockvo);
			orderMapper.inductSales(salesvo);
			
		}
		
		/* 장바구니 DB 제거 */
		for (OrderDetailDTO odd : ord.getOrders()) {
			
			CartDTO cartDTO = new CartDTO();
			cartDTO.setMid(ord.getMid());
			cartDTO.setBid(odd.getBid());
			
			cartMapper.deleteOrderCart(cartDTO);
			
		}

	}

	@Override
	public OrderDTO orderComplete(String orderid) {
		
		log.info("get order complete item");
		
		OrderDTO od = orderMapper.getOrderCompleteInfo(orderid);
		
		for(OrderDetailDTO odd : od.getOrders()) {
			
			List<BookAttachVO> attachList = attachMapper.findByBid(odd.getBid());
			odd.setAttachList(attachList);
			
		}

		return od;
	}
	
	@Override
	public List<OrderDTO> getOrderList(Criteria cri) {
		return orderMapper.getOrderListWithPaging(cri);
	}

	@Override
	public int getOrderTotal(Criteria cri) {
		return orderMapper.getOrderTotalCount(cri);
	}

	@Override
	@Transactional
	public void orderCancel(OrderCancelDTO ocd) {
		
		/* 주문 상품 */
		OrderDTO dto = orderMapper.getOrderCompleteInfo(ocd.getOrderid());
		List<OrderDetailDTO> ords = dto.getOrders();
		
		for(OrderDetailDTO ordetail : ords) {
			
			BookVO book = bookMapper.readmap(ordetail.getBid());
			int bid = book.getBid();
			BookStockVO stockvo = new BookStockVO();
			BookSalesVO salesvo = new BookSalesVO();
			int stock = book.getStock() + ordetail.getOdetailquan();
			int sales = book.getSales() - ordetail.getOdetailquan();
			log.info(book.getStock());
			stockvo.setBid(bid);
			stockvo.setStock(stock);
			salesvo.setBid(bid);
			salesvo.setSales(sales);

			orderMapper.deductStock(stockvo);
			orderMapper.inductSales(salesvo);
			
		}
		
		orderMapper.orderCancel(ocd.getOrderid());

	}

}