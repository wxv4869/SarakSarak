package org.sarak.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Criteria {    // 페이징에 사용되는 조건 (페이지 번호, 페이지 당 아이템 수)
	
	private int pageNum;
	
	private int amount;
	
	public Criteria() {
		
		this(1, 10);
		
	}
	
	public Criteria(int pageNum, int amount) {
		
		this.pageNum = pageNum;
		
		this.amount = amount;
		
	}

}
