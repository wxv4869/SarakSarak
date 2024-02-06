package org.sarak.domain;

import lombok.Data;

@Data
public class OrderCancelDTO {
	
	private String mid;
	private String orderid;
	private int amount;
	private int pageNum;
	
}