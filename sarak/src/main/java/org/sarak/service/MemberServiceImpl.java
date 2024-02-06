package org.sarak.service;

import java.util.List;

import org.sarak.domain.AuthVO;
import org.sarak.domain.Criteria;
import org.sarak.domain.MemberVO;
import org.sarak.mapper.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class MemberServiceImpl implements MemberService{
	
	@Setter(onMethod_ = @Autowired)
	private MemberMapper memberMapper;

	@Transactional
	@Override
	public void registerMember(MemberVO memberVo, AuthVO authVo) throws Exception {
		
		log.info("register...");
		
		memberMapper.register(memberVo);
		
		log.info("insert Auth...");
		
		memberMapper.insertAuth(authVo);
		
	}

	@Override
	public MemberVO get(String mid) {
		
		log.info("get...");
		
		return memberMapper.read(mid);
		
	}

	@Override
	public boolean modifyMember(MemberVO member) {
		
		log.info("modify..." + member);
		
		return (memberMapper.update(member) == 1) ;
		
	}

	@Override
	public boolean removeMember(String mid) {
		
		log.info("remove..." + mid);
		
		return (memberMapper.deleteAuth(mid) == 1) && (memberMapper.delete(mid) == 1) ;
	
	}

	@Override
	
	public List<MemberVO> getList() {
		
		log.info("getList...");
		
		return memberMapper.getList();
		
	}

	@Override
	public boolean modifyAuth(AuthVO auth) {
		
		log.info("modify..." + auth);
		
		return (memberMapper.updateAuth(auth) == 1);
		
	}
	
	@Override
	public boolean modifyPassword(MemberVO member) {
		
		log.info("modify..." + member);
		
		return (memberMapper.updatePwd(member) == 1);
		
	}

	@Override
	public List<MemberVO> getListWithPaging(Criteria cri) {
		
		log.info("getListWithPaging...");
		
		return memberMapper.getListWithPaging(cri);
		
	}
	
	@Override
	public int memberGetTotal(Criteria cri) {
		
		log.info("memberGetTotal..." + cri);
		
		return memberMapper.memberGetTotal(cri);
		
	}

}