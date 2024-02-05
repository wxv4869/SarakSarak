package org.sarak.service;

import java.util.List;

import org.sarak.domain.BookVO;
import org.sarak.domain.Criteria;
import org.sarak.domain.OrderDTO;
import org.sarak.domain.OrderDetailDTO;
import org.springframework.stereotype.Service;

@Service
public interface AdminService {
	
	public List<BookVO> bookGetList(Criteria cri);
	
	public int bookGetTotal(Criteria cri);
	
	public BookVO bookGetDetail(int bid);
	
	public void bookInsert(BookVO bookVO);
	
	public void bookModify(BookVO bookVO);
	
	public void bookDelete(int bid);
	
	public List<OrderDTO> orderGetList(Criteria cri);
	
	public int orderGetTotal(Criteria cri);
	
	public int orderstateUpdate(OrderDTO orderDTO);
	
	public int deleteEachImg(String filename);
	
	public List<OrderDetailDTO> orderGetDetail(String orderid);

}
