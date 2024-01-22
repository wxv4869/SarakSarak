package org.sarak.service;

import org.sarak.mapper.BookMapper;
import org.sarak.domain.BookVO;
import org.sarak.domain.Criteria;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class BookServiceImpl implements BookService {    // BookService 인터페이스 구현
	
	private BookMapper bookMapper;

	@Override
	public BookVO get(int bid) {
		
		return null;
		
	}

	@Override
	public boolean modify(BookVO book) {
		
		return false;
		
	}

	@Override
	public boolean remove(int bid) {
		
		return false;
		
	}
	
	@Override
	public List<BookVO> allBookList(Criteria cri) {
		
		log.info("###### all book list with criteria ######" + cri);
		
		// 페이징 조건을 이용하여 전체 도서 목록 가져옴
		return bookMapper.bookListWithPaging(cri);
		
	}

	@Override
	public int getTotal(Criteria cri) {
		
		log.info("get total count");
		
		// 전체 도서 수 가져옴 (페이징)
		return bookMapper.getTotalCount(cri);
		
	}

}
