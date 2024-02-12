package org.sarak.service;

import java.util.List;

import org.sarak.domain.BookVO;
import org.sarak.domain.Criteria;
import org.sarak.domain.OrderDTO;
import org.sarak.domain.OrderDetailDTO;
import org.sarak.mapper.AdminMapper;
import org.sarak.mapper.BookAttachMapper;
import org.sarak.mapper.BookMapper;
import org.sarak.mapper.OrderMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class AdminServiceImpl implements AdminService {
	
	@Setter(onMethod_ = @Autowired)
	private AdminMapper adminMapper;
	
	@Setter(onMethod_ = @Autowired)
	private BookMapper bookMapper;
	
	@Setter(onMethod_ = @Autowired)
	private BookAttachMapper bookAttachMapper;
	
	@Setter(onMethod_ = @Autowired)
	private OrderMapper orderMapper;
	
	@Override
	public List<BookVO> bookGetList(Criteria cri) {
		
		log.info("(service)bookGetList()........" + cri);
		
		return adminMapper.bookGetList(cri);
		
	}
	
	@Override
	public int bookGetTotal(Criteria cri) {
		
		log.info("(service)bookGetTotal()........" + cri);
		
		return adminMapper.bookGetTotal(cri);
		
	}
	
	@Override
	public BookVO bookGetDetail(int bid) {
		
		log.info("(service)authorGetDetail()........" + bid);
		
		return bookMapper.readmap(bid);
		
	}
	
	@Transactional
	@Override
	public void bookInsert(BookVO bookVO) {
		
		log.info("(service)bookInsert......");
		
		adminMapper.bookInsert(bookVO);
		
		adminMapper.bookStockInsert(bookVO);
		
		adminMapper.bookSalesInsert(bookVO);
		
	}
	
	@Transactional
	@Override
	public void bookModify(BookVO bookVO) {
		
		log.info("(service)bookModify......");
		
		adminMapper.bookModify(bookVO);
		
		adminMapper.bookStockModify(bookVO);
		
	}
	
	@Transactional
	@Override
	public void bookDelete(int bid) {
		
		log.info("(service)bookDelete......");
		
		bookAttachMapper.deleteAll(bid);
		
		adminMapper.bookStockDelete(bid);
		
		adminMapper.bookSalesDelete(bid);
		
		adminMapper.bookDelete(bid);
		
	}
	
	@Override
	public int deleteEachImg(String filename) {
		
		log.info("(service)deleteEachImg......");
		
		return adminMapper.deleteEachImg(filename);
		
	}
	
	@Override
	public List<OrderDTO> orderGetList(Criteria cri) {
		
		log.info("(service)orderGetList()........" + cri);
		
		return adminMapper.orderGetList(cri);
		
	}
	
	@Override
	public int orderGetTotal(Criteria cri) {
		
		log.info("(service)orderGetTotal()........" + cri);
		
		return adminMapper.orderGetTotal(cri);
		
	}
	
	@Override
	public int orderstateUpdate(OrderDTO orderDTO) {
		
		log.info("(service)updateOrderState......");
		
		return adminMapper.orderstateUpdate(orderDTO);
		
	}
	
	@Override
	public List<OrderDetailDTO> orderGetDetail(String orderid) {
		
		log.info("(service)orderGetDetail()........" + orderid);
		
		return orderMapper.orderGetDetail(orderid);
		
	}

}
