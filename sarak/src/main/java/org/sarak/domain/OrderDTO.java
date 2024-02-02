package org.sarak.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class OrderDTO {
	/* 주문 번호 */
	private String orderid;
	
	/* 배송 받는이 */
	private String ordername;
	
	/* 주문 회원 아이디 */
	private String mid;
	
	/* 주문 회원 전화번호 */
	private String orderphone;
	
	/* 우편번호 */
	private String orderpostcode;
	
	/* 회원 주소 */
	private String orderaddress;
	
	/* 주문 상태 */
	private String orderstate;
	
	/* 주문 상품 */
	private List<OrderDetailDTO> orders;	

	/* 주문 날짜 */
	private Date orderdate;
	
	/* 최종 판매 비용 */
	private int totalprice ;
	

	public int getOrderPriceInfo() {
		
			for(OrderDetailDTO order : orders) {
				totalprice += order.getTotalPrice();
			}
			
			return totalprice;
	}
}