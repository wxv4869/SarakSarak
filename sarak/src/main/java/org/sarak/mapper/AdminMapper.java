package org.sarak.mapper;

import java.util.List;
import java.util.Map;

import org.sarak.domain.BookStockVO;
import org.sarak.domain.BookVO;
import org.sarak.domain.Criteria;
import org.sarak.domain.OrderDTO;

public interface AdminMapper {
	
	public List<BookVO> bookGetList(Criteria cri);    // 도서 목록 (with 페이징)
	
	public int bookGetTotal(Criteria cri);    // 도서 총 수
	
	public void bookInsert(BookVO bookVO);    // 도서 등록
	
	public int bookModify(BookVO bookVO);    // 도서 수정
	
	public int bookDelete(Integer bid);    // 도서 삭제
	
	public List<OrderDTO> orderGetList(Criteria cri);    // 주문 목록 (with 페이징)
	
	public int orderGetTotal(Criteria cri);    // 주문 총 수
	
	public int orderstateUpdate(OrderDTO orderDTO);    // 주문 상태 변경
	
	public int bookStockInsert(BookVO bookVO);    // 재고 데이터 생성

}
