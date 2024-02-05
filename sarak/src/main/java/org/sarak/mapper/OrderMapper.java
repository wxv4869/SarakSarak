package org.sarak.mapper;

import java.util.List;

import org.sarak.domain.BookSalesVO;
import org.sarak.domain.BookStockVO;
import org.sarak.domain.BookVO;
import org.sarak.domain.OrderDTO;
import org.sarak.domain.OrderDetailDTO;
import org.sarak.domain.OrderPageItemDTO;

public interface OrderMapper {
	
	/* 주문 상품 정보 */
	public OrderPageItemDTO getBooksInfo(int bid);
	
	/* 주문 상품 정보(주문 처리) */
	public OrderDetailDTO getOrderInfo(int bid);
	
	/* 주문 테이블 등록 */
	public int enrollOrder(OrderDTO ord);
	
	/* 주문 도서 테이블 등록 */
	public int enrollOrderDetail(OrderDetailDTO ordd);
	
	/* 주문 재고 차감 */
	public int deductStock(BookStockVO stock);
	
	/* 판매량 누적 */
	public int inductSales(BookSalesVO sales);
	
	public OrderDTO getOrderCompleteInfo(String orderid);
	
	public List<OrderDetailDTO> orderGetDetail(String orderid);
	
}