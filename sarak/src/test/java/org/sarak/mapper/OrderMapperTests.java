package org.sarak.mapper;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.sarak.domain.BookSalesVO;
import org.sarak.domain.BookVO;
import org.sarak.domain.OrderDTO;
import org.sarak.domain.OrderDetailDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class OrderMapperTests {

	@Setter(onMethod_ = @Autowired)
	private OrderMapper orderMapper;

//	@Test
//	public void getOrderInfoTest() {
//		OrderDetailDTO orderInfo = orderMapper.getOrderInfo(1);
//		
//		log.info(orderInfo);
//	}

//	@Test
//	public void enrollOrderTest() {
//		
//		OrderDTO ord = new OrderDTO();
//		
//		List<OrderDetailDTO> orders = new ArrayList();
//		
//		OrderDetailDTO order1 = new OrderDetailDTO();
//		
//		order1.setOdetailid(1);
//		order1.setBid(1);
//		order1.setOdetailquan(2);
//		order1.setOdetailprice(30000);
//		order1.initSaleTotal();
//		
//		ord.setOrders(orders);
//		ord.setOrderid(1);
//		ord.setOrdername("bb");
//		ord.setMid("bb");
//		ord.setOrderphone("bb");
//		ord.setOrderpostcode("bb");
//		ord.setOrderaddress("bb");
//		ord.setOrderState("배송준비중");
//		ord.setTotalprice(ord.getOrderPriceInfo());
//	
//		orderMapper.enrollOrder(ord);
//		
//			
//	}

//	@Test
//	public void enrollOrderItemTest() {

//		OrderDetailDTO oid = new OrderDetailDTO();

//		oid.setOdetailid(1);
//		oid.setOrderid(3);
//		oid.setBid(1);
//		oid.setOdetailquan(2);
//		oid.setOdetailprice(30000);				
//		oid.initSaleTotal();
//		
//		orderMapper.enrollOrderItem(oid);

//	}	


//	@Test
//	public void deductStockTest() {
//		BookVO book = new BookVO();
//		
//		book.setBid(1);
//		book.setStock(99);
//		
//		orderMapper.deductStock(book);
//	}

//	@Test
//	public void inductSalesTest() {
//		BookSalesVO vo = new BookSalesVO();
//		
//		vo.setBid(1);
//		vo.setSales(99);
//		
//		orderMapper.inductSales(vo);
//	}

	@Test
	public void getOrderCompleteInfoTest() {

	    OrderDTO order = orderMapper.getOrderCompleteInfo("bb_2024013103");
	    log.info(order);
	}

}