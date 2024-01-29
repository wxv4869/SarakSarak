package org.sarak.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.sarak.domain.Criteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BookServiceTests {
	
	@Setter(onMethod_ = {@Autowired})
	private BookService bookService;
	
//	@Test
//	public void testAllBookList() {
//		
//		bookService.allBookList(new Criteria(2, 10)).forEach(book -> log.info(book));
//		
//	}
	
//	@Test
//	public void testBestBookList() {
//		
//		bookService.bestBookList(new Criteria(2, 10)).forEach(book -> log.info(book));
//		
//	}
	
	@Test
	public void testNewBookList() {
		
		bookService.newBookList(new Criteria(2, 10)).forEach(book -> log.info(book));
		
	}
	

}
