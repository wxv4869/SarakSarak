package org.sarak.domain;

import lombok.Data;
import lombok.ToString;

@ToString
@Data
public class PageDTO {    // 페이징 처리에 필요한 정보
	
	private int startPage;
	
	private int endPage;
	
	private boolean prev, next;
	
	private int total;
	
	private Criteria cri;
	
	public PageDTO(Criteria cri, int total) {
		
		this.cri = cri;
		
		this.total = total;
		
		this.endPage = (int) (Math.ceil(cri.getPageNum() / 10.0)) * 10;
		
		this.startPage = this.endPage - 9;
		
		int realEnd = (int) (Math.ceil((total * 1.0) / cri.getAmount()));
		
		if (realEnd < this.endPage) {
			
			this.endPage = realEnd;
			
		}
		
		this.prev = this.startPage > 1;
		
		this.next = this.endPage < realEnd;
		
	}

}
