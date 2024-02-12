package org.sarak.mapper;

import java.util.List;
import java.util.Map;

import org.sarak.domain.BookSalesVO;
import org.sarak.domain.BookStockVO;
import org.sarak.domain.Criteria;
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
	
	/* 주문 완료 정보 */
	public OrderDTO getOrderCompleteInfo(String orderid);
	
	/* 주문 상품 리스트 */
	public List<OrderDTO> getOrderListWithPaging(Map<String, Object> parameters);
	
	/* 주문 총 갯수 */
	public int getOrderTotalCount(Map<String, Object> parameters);
	
	/* 주문 취소 */
	public int orderCancel(String orderid);
	
	/* 관리자 - 주문 상세 정보 */
	public List<OrderDetailDTO> orderGetDetail(String orderid);
	
	/* 회원 삭제 시 회원의 주문 정보 삭제를 위해 해당 회원의 모든 주문 정보 가져오기 */
	public List<OrderDTO> getOrderListByMid(String mid);
	
}