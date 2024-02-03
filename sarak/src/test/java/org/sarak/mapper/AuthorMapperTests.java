package org.sarak.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.sarak.domain.AuthorVO;
import org.sarak.domain.Criteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class AuthorMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	private AuthorMapper authorMapper;
	
	// 작가 목록 테스트
//	@Test
//	public void authorGetListTests() throws Exception {
//		
//		Criteria cri = new Criteria();
//		cri.setPageNum(3);
//		cri.setAmount(10);
//		
//		List<AuthorVO> authorList = authorMapper.authorGetList(cri);
//		
//		authorList.forEach(author -> log.info(author.getAuthorid()));
//	}
	
	// 작가 총 수 테스트
//	@Test
//	public void authorGetTotalTest() throws Exception {
//		
//		Criteria cri = new Criteria();
//		
//		int total = authorMapper.authorGetTotal(cri);
//		
//		log.info(total);
//		
//	}
	
	// 작가 상세 테스트
//	@Test
//	public void authorGetDetailTest() {
//		
//		int authorid = 15;
//		
//		AuthorVO authorVO = authorMapper.authorGetDetail(authorid);
//		
//		log.info(authorVO);
//		
//	}
	
	// 작가 등록 테스트
//	@Test
//	public void authorInsertTest() throws Exception {
//		
//		AuthorVO authorVO = new AuthorVO();
//		
//		authorVO.setAuthorname("칼 세이건");
//		authorVO.setAuthordesc("테스트");
//		
//		authorMapper.authorInsert(authorVO);
//		
//	}
	
	// 작가 정보 수정 테스트
//	@Test
//	public void authorModifyTest() throws Exception {
//		
//		AuthorVO authorVO = new AuthorVO();
//		
//		authorVO.setAuthorid(45);
//		
//		log.info("수정 전 : " + authorMapper.authorGetDetail(authorVO.getAuthorid()));
//		
//		authorVO.setAuthorname("베르나르 베르베르");
//		authorVO.setAuthordesc("베르베르베르베르베르베르베르베르");
//		
//		authorMapper.authorModify(authorVO);
//		
//		log.info("수정 후 : " + authorMapper.authorGetDetail(authorVO.getAuthorid()));
//		
//	}
	
	// 작가 삭제 테스트
//	@Test
//	public void authorDeleteTest() throws Exception {
//		
//		int authorid = 45;
//		
//		int result = authorMapper.authorDelete(authorid);
//		
//		if (result == 1) {
//			
//			log.info("삭제 성공");
//			
//		}
//		
//	}

}
