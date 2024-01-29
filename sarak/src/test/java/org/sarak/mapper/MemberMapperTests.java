package org.sarak.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;
import org.sarak.domain.AuthVO;
import org.sarak.domain.Criteria;
import org.sarak.domain.MemberVO;
import org.sarak.mapper.MemberMapperTests;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@Log4j
public class MemberMapperTests {

	@Setter(onMethod_ = @Autowired)
	private MemberMapper mapper;
	
	@Test
	public void testRegister() throws Exception {
		
		MemberVO member = new MemberVO();
		member.setMid("test");
		member.setMpw("test");
		member.setMname("test");
		member.setPhone("01000000000");
		member.setEmail("test@gmail.com");
		member.setPostcode("00000");
		member.setAddress("test");
		
		AuthVO auth = new AuthVO();
		auth.setMid("test");
		auth.setAuth("ROLE_USER");
		
//		mapper.register(member);
//		mapper.insertAuth(auth);
		
		log.info("register : " + member);
		
	}
	
//	@Test
//	public void testRead() {
//	
//		MemberVO vo = mapper.read("test");
//		log.info(vo);
//	
//		
//	}
	
	@Test
	public void testGetList() {
		
		mapper.getList().forEach(member -> log.info("getList : " + member));
		
	}
	
	@Test
	public void testDelete() {
		
//		log.info("DELETE COUNT : " + mapper.deleteAuth("test"));
		
//		log.info("DELETE COUNT : " + mapper.delete("cc"));
		
	}
	
	@Test
	public void testUpdate() {
		
		MemberVO member = new MemberVO();
		member.setMid("cc");
		member.setMpw("cc");
		member.setPhone("cc");
		member.setPostcode("cc");
		member.setEmail("cc");
		member.setMname("cc3");
		member.setAddress("cctest");
		AuthVO auth = new AuthVO();
		auth.setMid("cc");
		auth.setAuth("ROLE_ADMIN");
		
//		int count = mapper.update(member);
//		int countAuth = mapper.updateAuth(auth);
//		log.info("UPDATE COUNT : " + countAuth);
		
	}
	
	@Test
	public void testPaging() {
		
		Criteria cri = new Criteria();
		
		List<MemberVO> list = mapper.getListWithPaging(cri);
		
		list.forEach(member -> log.info(member));
		
	}
}