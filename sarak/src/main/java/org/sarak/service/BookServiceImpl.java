package org.sarak.service;

import org.sarak.mapper.BookAttachMapper;
import org.sarak.mapper.BookMapper;
import org.sarak.domain.BookAttachVO;
import org.sarak.domain.BookVO;
import org.sarak.domain.Criteria;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class BookServiceImpl implements BookService {    // BookService 인터페이스 구현
	
	@Setter(onMethod_ = @Autowired)
	private BookMapper bookMapper;
	
	@Setter(onMethod_ = @Autowired)
	private BookAttachMapper bookAttachMapper;

	@Override
	public BookVO get(int bid) {
	
		BookVO book = bookMapper.read(bid);

	    if (book != null) {
	    	
	    	String authorname = bookMapper.getAuthornameById(book.getAuthorid());
	        
	    	book.setAuthorname(authorname);
	        
	    }

	    return book;
		
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
		
		// 매퍼메서 책 목록 가져옴
		List<BookVO> bookList = bookMapper.bookListWithPaging(cri);
		
		// 각 책에 대해 작가 이름 설정
		for (BookVO book : bookList) {
			
			String authorname = bookMapper.getAuthornameById(book.getAuthorid());

			log.info("작가 이름 : " + book.getBid() + authorname);

			book.setAuthorname(authorname);
			
		}
		
		return bookList;
		
	}

	@Override
	public int getTotal(Criteria cri) {
		
		log.info("get total count");
		
		// 전체 도서 수 가져옴 (페이징)
		return bookMapper.getTotalCount(cri);
		
	}
	
	@Override
	public List<BookAttachVO> getAttachList(int bid) {
		
		log.info("get attch list by bid" + bid);
		
		return bookAttachMapper.findByBid(bid);
		
	}
	
	@Override
	public List<BookAttachVO> getMainImgAttachList(int bid) {
		
		return bookMapper.getMainImgAttachList(bid);
		
	}
	
	@Override
	public BookVO getMap(int bid) {
		
		log.info("getMap...");
		
		BookVO bookVO = bookMapper.readmap(bid);
		
		return bookVO;
		
	}
	
	@Override
	public List<BookVO> allBookListMap(Criteria cri) {
		
		return null;
		
	}
	
	@Override
	public List<BookVO> bestBookList(Criteria cri) {
		
		log.info("###### best book list with criteria ######" + cri);	
		
		// 페이징 조건을 이용하여 베스트 전체 도서 목록 가져옴
		return bookMapper.bestBookListWithPaging(cri);
	
	}
	
	@Override
	public List<BookVO> newBookList(Criteria cri) {
		
		log.info("###### new book list with criteria ######" + cri);	
		
		// 페이징 조건을 이용하여 베스트 전체 도서 목록 가져옴
		return bookMapper.newBookListWithPaging(cri);
	
	}
	
	@Override
	public int getBestTotal(Criteria cri) {
		
		log.info("get best total count");
		
		// 베스트 전체 도서 수 가져옴 (페이징)
		return bookMapper.getBestTotalCount(cri);
		
	}

	@Override
	public int getNewTotal(Criteria cri) {
		
		log.info("get new total count");
		
		// 베스트 전체 도서 수 가져옴 (페이징)
		return bookMapper.getNewTotalCount(cri);
		
	}

}
