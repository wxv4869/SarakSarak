package org.sarak.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.sarak.domain.BookVO;
import org.sarak.domain.Criteria;

@Mapper
public interface BookMapper {    // 데이터베이스에 접근하는 메서드 정의
	
	public void insert(BookVO book);    // 도서 추가 (관리자)
	
	public void insertSelectKey(BookVO book);    // 도서 추가 (자동 생성된 키 반환)
	
	public BookVO read(int bid);    // 도서 조회
	
	public int delete(int bid);    // 도서 삭제 (관리자)
	
	public int update(BookVO book);    // 도서 수정 (관리자)
	
	public List<BookVO> allBookList();    // 전체 도서 목록 가져오기

	public List<BookVO> allBookListAjax();    // 전체 도서 목록 비동기로 가져오기
	
	public List<BookVO> bookListWithPaging(Criteria cri);    // 페이징된 도서 목록 가져오기
	
	public int getTotalCount(Criteria cri);    // 전체 도서 수 가져오기 (페이징)

}
