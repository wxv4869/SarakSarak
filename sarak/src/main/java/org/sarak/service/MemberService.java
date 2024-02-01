package org.sarak.service;

import java.util.List;

import org.sarak.domain.AuthVO;
import org.sarak.domain.MemberVO;

public interface MemberService {

	public void registerMember(MemberVO member, AuthVO auth) throws Exception;
	
	public MemberVO get(String mid);
	
	public boolean modifyMember(MemberVO member);
	
	public boolean modifyAuth(AuthVO auth);
	
	public boolean removeMember(String mid);
	
	public List<MemberVO> getList();
	
	
}