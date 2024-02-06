package org.sarak.service;

import java.util.List;

import org.sarak.domain.Criteria;
import org.sarak.domain.OrderCancelDTO;
import org.sarak.domain.OrderDTO;
import org.sarak.domain.OrderPageItemDTO;

public interface OrderService {

	/* 주문 정보 */
	public List<OrderPageItemDTO> getBooksInfo(List<OrderPageItemDTO> orders);

	/* 주문 */
	public void order(OrderDTO ord);

	/* 주문 저장 정보 */
	public OrderDTO orderComplete(String orderid);
	
	/* 주문 상품 리스트 */
	public List<OrderDTO> getOrderList(Criteria cri);
	
	/* 주문 총 개수 */
	public int getOrderTotal(Criteria cri);
	
	/* 주문 취소 */
	public void orderCancel(OrderCancelDTO ocd);

}