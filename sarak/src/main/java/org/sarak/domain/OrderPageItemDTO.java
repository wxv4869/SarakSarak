package org.sarak.domain;

import java.util.List;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class OrderPageItemDTO {
	
	/* 뷰로부터 전달 받을 값 */
	private int bid;
	
	private int bookCount;
	
	/* DB로부터 꺼내올 값 */
	private String bname;

	private int bprice;
	
	/* 만들어 낼 값 */
	private int totalPrice;
	
	/* 상품 이미지 */
	private List<BookAttachVO> attachList;
	
	public int initSaleTotal() {
		this.totalPrice = this.bprice * this.bookCount;
		return totalPrice;
	}
	
	@Override
	public String toString() {
		return "OrderPageItemDTO [bid=" + bid + ", bookCount=" + bookCount + ", bname=" + bname + ", bprice=" + bprice + ", totalPrice=" + totalPrice + "]";
	}
	
}