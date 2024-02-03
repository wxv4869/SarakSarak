package org.sarak.service;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.sarak.domain.AuthorVO;
import org.sarak.domain.Criteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class AuthorServiceTests {
	
	@Autowired
	private AuthorService authorService;
	
	// 작가 목록 테스트
//	@Test
//	public void authorGetListTest() throws Exception {
//		
//		Criteria cri = new Criteria();
//		cri.setPageNum(3);
//		cri.setAmount(10);
//		
//		List<AuthorVO> authorList = authorService.authorGetList(cri);
//		
//		authorList.forEach(author -> log.info(author.getAuthorid()));
//		
//	}
	
	// 작가 상세 테스트
//	@Test
//	public void authorGetDetailTest() throws Exception {
//		
//		int authorid = 18;
//		
//		log.info("author detail....." + authorService.authorGetDetail(authorid));
//		
//	}
	
	// 작가 등록 테스트
//	@Test
//	public void authorInsertTest() throws Exception {
//		
//		AuthorVO authorVO = new AuthorVO();
//		
//		authorVO.setAuthorid(44);
//		authorVO.setAuthorname("칼 세이건");
//		authorVO.setAuthordesc("테스트");
//		
//		authorService.authorInsert(authorVO);
//		
//	}
	
	// 작가 수정 테스트
//	@Test
//	public void authorModifyTest() throws Exception {
//		
//		AuthorVO authorVO = new AuthorVO();
//		
//		authorVO.setAuthorid(45);
//		
//		log.info("(service)수정 전 : " + authorService.authorGetDetail(authorVO.getAuthorid()));
//		
//		authorVO.setAuthorname("베르나르 베르베르");
//		authorVO.setAuthordesc("service 수정 테스트");
//		
//		authorService.authorModify(authorVO);
//		
//		log.info("(service)수정 후 : " + authorService.authorGetDetail(authorVO.getAuthorid()));
//		
//	}
	
	// 작가 삭제 테스트
//	@Test
//	public void authorDeleteTest() throws Exception {
//		
//		int authorid = 44;
//		
//		int result = authorService.authorDelete(authorid);
//		
//		if (result == 1) {
//			
//			log.info("(service)삭제 성공");
//			
//		}
//		
//	}

}
