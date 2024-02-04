package org.sarak.service;

import java.util.List;

import org.sarak.domain.BookAttachVO;
import org.sarak.domain.BookVO;
import org.sarak.domain.Criteria;
import org.springframework.stereotype.Service;

@Service
public interface BookService {    // 비즈니스 로직
	
	public BookVO get(int bid);    // 도서 조회
	
	public BookVO getMap(int bid); // map을 이용한 도서 조회
	
	public List<BookVO> allBookListMap(Criteria cri);
	
	public List<BookVO> bestBookList(Criteria cri);
	
	public List<BookVO> newBookList(Criteria cri);
	
	public List<BookVO> allBookList(Criteria cri);    // 전체 도서 목록
	
	public int getTotal(Criteria cri);    // 전체 도서 수
	
	public int getBestTotal(Criteria cri);    // 베스트 전체 도서 수
	
	public int getNewTotal(Criteria cri);    // 신간 전체 도서 수
	
	public List<BookAttachVO> getAttachList(int bid);
	
	public List<BookAttachVO> getMainImgAttachList(int bid);
	
}
