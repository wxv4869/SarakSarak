package org.sarak.domain;

import java.util.List;

import lombok.Data;

@Data
public class OrderDetailDTO {
	
	private String orderid;
    private int bid;
    private int odetailquan;
    private int odetailprice;
    private char doreview;
    
    private String bname;
    
    private int totalPrice;
    
    private List<BookAttachVO> attachList;
    
	public void initSaleTotal() {
		this.totalPrice = this.odetailprice * this.odetailquan;
	}
	
}