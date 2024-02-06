package org.sarak.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class OrderDTO {
	
	private String orderid;
	private String ordername;
	private String mid;
	private String orderphone;
	private String orderpostcode;
	private String orderaddress;
	private String orderstate;
	private Date orderdate;
	private int totalprice;
	
	private List<OrderDetailDTO> orders;

	public int getOrderPriceInfo() {
		for(OrderDetailDTO order : orders) {
			totalprice += order.getTotalPrice();
		}
		return totalprice;
	}
	
}