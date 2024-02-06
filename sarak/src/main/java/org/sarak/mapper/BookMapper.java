package org.sarak.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.sarak.domain.BookAttachVO;
import org.sarak.domain.BookVO;
import org.sarak.domain.Criteria;

@Mapper
public interface BookMapper {
	
	public BookVO read(int bid);    // 도서 조회
	
	public BookVO readmap(int bid);    // Map을 이용한 도서 조회
	
	public BookVO readAllBookList();
	
	public List<BookVO> allBookList();    // 전체 도서 목록 가져오기

	public List<BookVO> allBookListAjax();    // 전체 도서 목록 비동기로 가져오기
	
	public List<BookVO> bookListWithPaging(Criteria cri);    // 페이징된 도서 목록 가져오기
	
	public List<BookVO> bestBookListWithPaging(Criteria cri);
	
	public List<BookVO> newBookListWithPaging(Criteria cri);
	
	public int getTotalCount(Criteria cri);    // 전체 도서 수 가져오기 (페이징)
	
	public int getBestTotalCount(Criteria cri);
	
	public int getNewTotalCount(Criteria cri);
	
	public List<BookVO> bestBookList();
	
	public List<BookVO> newBookList();

	public List<BookAttachVO> getMainImgAttachList(int bid);
	
	public String getAuthornameById(int authorid);
	
}
