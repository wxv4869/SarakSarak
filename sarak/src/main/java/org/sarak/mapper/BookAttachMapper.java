package org.sarak.mapper;

import java.util.List;

import org.sarak.domain.BookAttachVO;

public interface BookAttachMapper {
	
	public void insert(BookAttachVO vo);
	
	public void delete(int bid);
	
	public List<BookAttachVO> findByBid(int bid);

}
