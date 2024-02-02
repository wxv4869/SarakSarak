package org.sarak.service;

import java.util.List;

import org.sarak.domain.OrderDTO;
import org.sarak.domain.OrderPageItemDTO;

public interface OrderService {

	/* 주문 정보 */
	public List<OrderPageItemDTO> getBooksInfo(List<OrderPageItemDTO> orders);

	/* 주문 */
	public void order(OrderDTO ord);

	/* 주문 저장 정보 */
	public OrderDTO orderComplete(String orderid);

}