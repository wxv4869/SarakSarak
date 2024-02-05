package org.sarak.mapper;

import java.util.List;

import org.sarak.domain.AuthVO;
import org.sarak.domain.MemberVO;
import org.sarak.domain.Criteria;

public interface MemberMapper {

	public void register(MemberVO member) throws Exception;
	
	public void insertAuth(AuthVO auth);
	
	public MemberVO read(String mid);
	
	public List<MemberVO> getList();
	
	public List<MemberVO> getListWithPaging(Criteria cri);
	
	public int delete(String mid);
	
	public int deleteAuth(String mid);

	public int update(MemberVO member);
	
	public int updateAuth(AuthVO auth);
	
	public int memberGetTotal(Criteria cri);

}