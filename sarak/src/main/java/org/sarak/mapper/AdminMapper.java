package org.sarak.mapper;

import java.util.List;

import org.sarak.domain.BookVO;
import org.sarak.domain.Criteria;

public interface AdminMapper {
	
	public List<BookVO> bookGetList(Criteria cri);    // 도서 목록 (with 페이징)
	
	public int bookGetTotal(Criteria cri);    // 도서 총 수
	
	public void bookInsert(BookVO bookVO);    // 도서 등록
	
	public int bookModify(BookVO bookVO);    // 도서 수정
	
	public int bookDelete(Integer bid);    // 도서 삭제

}
