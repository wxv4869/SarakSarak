package org.sarak.service;

import java.util.List;

import org.sarak.domain.BookAttachVO;
import org.sarak.domain.BookVO;
import org.sarak.domain.Criteria;
import org.springframework.stereotype.Service;

@Service
public interface BookService {    // 비즈니스 로직
	
	public BookVO get(int bid);    // 도서 조회
	
	public boolean modify(BookVO book);    // 도서 수정
	
	public boolean remove(int bid);    // 도서 삭제
	
	public List<BookVO> allBookList(Criteria cri);    // 전체 도서 목록
	
	public int getTotal(Criteria cri);    // 전체 도서 수
	
	public List<BookAttachVO> getAttachList(int bid);
	
}
