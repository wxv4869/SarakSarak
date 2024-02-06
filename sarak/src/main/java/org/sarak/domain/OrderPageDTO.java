package org.sarak.domain;

import java.util.List;

import lombok.Data;

@Data
public class OrderPageDTO {
	
	private List<OrderPageItemDTO> orders;
	
	@Override
	public String toString() {
		return "OrderPageDTO [orders=" + orders + "]";
	}
	
}