package org.sarak.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.sarak.domain.Criteria;
import org.sarak.domain.OrderCancelDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class OrderServiceTests {
	
	@Setter(onMethod_ = {@Autowired})
	private OrderService orderService;
	
//	@Test
//	public void testOrderList() {
//		
//		orderService.getOrderList(new Criteria(1, 10), "bb").forEach(order -> log.info(order));
//		
//	}
	
	@Test
	public void testOrderCancle() {
		
		OrderCancelDTO dto = new OrderCancelDTO();
		
		dto.setMid("bb");
		dto.setOrderid("bb_2024020132");
		
		orderService.orderCancel(dto);
	}
	
}