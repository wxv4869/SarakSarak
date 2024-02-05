package org.sarak.mapper;

import java.util.List;

import org.sarak.domain.BookAttachVO;

public interface BookAttachMapper {
	
	public void insert(BookAttachVO vo);
	
	public List<BookAttachVO> findByBid(int bid);
	
	public void deleteAll(int bid);    // 해당 bid의 이미지 전체 삭제

}
