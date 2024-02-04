package org.sarak.service;

import java.util.List;

import org.sarak.domain.BookVO;
import org.sarak.domain.Criteria;
import org.springframework.stereotype.Service;

@Service
public interface AdminService {
	
	public List<BookVO> bookGetList(Criteria cri);
	
	public int bookGetTotal(Criteria cri);
	
	public BookVO bookGetDetail(int bid);
	
	public void bookInsert(BookVO bookVO);
	
	public int bookModify(BookVO bookVO);
	
	public int bookDelete(int bid);
	
	public void bookImageDelete(int bid, String filename);

}
