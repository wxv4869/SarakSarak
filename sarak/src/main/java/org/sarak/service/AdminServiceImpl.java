package org.sarak.service;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.Map;

import org.sarak.domain.AuthorVO;
import org.sarak.domain.BookVO;
import org.sarak.domain.Criteria;
import org.sarak.domain.OrderDTO;
import org.sarak.mapper.AdminMapper;
import org.sarak.mapper.BookAttachMapper;
import org.sarak.mapper.BookMapper;
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
		
	}
	
	@Transactional
	@Override
	public void bookModify(BookVO bookVO) {
		
		log.info("(service)bookModify......");
		
		adminMapper.bookModify(bookVO);
		
		adminMapper.bookStockModify(bookVO);
		
	}
	
	@Override
	public int bookDelete(int bid) {
		
		log.info("(service)bookDelete......");
		
		return adminMapper.bookDelete(bid);
		
	}
	
	@Override
	public void bookImageDelete(int bid, String filename) {
		
		try {
			
            // tbl_book_img 테이블에서 삭제
            bookAttachMapper.delete(bid);

            // 도서 이미지 파일 삭제
            Path filePath = Paths.get("C:\\saraksarak\\" + bid + "\\" + filename);
            Files.deleteIfExists(filePath);

        } catch (Exception e) {
        	
            log.error("도서 이미지 삭제 중 오류 발생 : " + e.getMessage());
        
        }
		
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

}
