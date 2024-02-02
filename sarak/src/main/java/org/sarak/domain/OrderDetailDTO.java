package org.sarak.domain;

import java.util.List;

import lombok.Data;

@Data
public class OrderDetailDTO {
	
	/* 주문 번호 */
	private String orderid;
	
	/* 상품 번호 */
    private int bid;
    
	/* 주문 수량 */
    private int odetailquan;
    
    private String bname;
    
	/* 상품 한 개 가격 */
    private int odetailprice;
   
	/* 총 가격(상품 한 개 가격 * 주문 수량) */
    private int totalPrice;
    
    private List<BookAttachVO> attachList;
    
    /* 후기 작성 여부 */
    private char doreview;
    
	public void initSaleTotal() {
		this.totalPrice = this.odetailprice * this.odetailquan;
	}
	
}