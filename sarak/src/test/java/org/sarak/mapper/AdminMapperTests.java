package org.sarak.mapper;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.sarak.domain.BookVO;
import org.sarak.domain.OrderDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class AdminMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	private AdminMapper adminMapper;
	
	// 상품 등록 테스트
	@Test
	public void bookInsertTest() {
		
		BookVO book = new BookVO();
		book.setBname("(mapper)insert test bname");
		book.setBprice(20000);
		book.setIsbn("152364223");
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
		Date pubdate;
		try {
			pubdate = dateFormat.parse("2024/01/01");
			book.setPubdate(pubdate);
		} catch (ParseException e) {
			e.printStackTrace();
		}
	    
	    book.setPublisher("(mapper)insert test pub");
	    book.setAuthorid(24);
		book.setSummary("(mapper)insert test sum");
		book.setContents("(mapper)insert test con");
		
		adminMapper.bookInsert(book);
		
		log.info(book);
		
	}

}
