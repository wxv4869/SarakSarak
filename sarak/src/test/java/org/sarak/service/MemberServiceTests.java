package org.sarak.service;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.sarak.domain.AuthVO;
import org.sarak.domain.MemberVO;
import org.sarak.mapper.MemberMapper;
import org.sarak.mapper.MemberMapperTests;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@Log4j
public class MemberServiceTests {

	@Setter(onMethod_ = @Autowired)
	private MemberService memberService;
	
	@Test
	public void testExist() {
		log.info(memberService);
		assertNotNull(memberService);
	}
	
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
		
		
//		memberService.registerMember(member, null);
		
		log.info("register : " + member);
	}
	
	@Test
	public void testGetList() {
		memberService.getList().forEach(member -> log.info(member));
	}
	
	@Test
	public void testGet() {
		log.info(memberService.get("aa"));
	}
	
	@Test
	public void testDelete() {
//		log.info("REMOVE RESULT :" + memberService.removeMember("cc"));
	}
	
	@Test
	public void testUpdate() {
		MemberVO member = memberService.get("bb");
		if(member == null) {
			return;
		}
		
		member.setMname("bb2");
		log.info("MODIFY RESULT : " + memberService.modifyMember(member));
	}
}