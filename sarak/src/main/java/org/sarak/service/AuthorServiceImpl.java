package org.sarak.service;

import java.util.List;

import org.sarak.domain.AuthorVO;
import org.sarak.domain.Criteria;
import org.sarak.mapper.AuthorMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jdk.internal.org.jline.utils.Log;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class AuthorServiceImpl implements AuthorService {
	
	@Setter(onMethod_ = @Autowired)
	private AuthorMapper authorMapper;
	
	public List<AuthorVO> authorGetList(Criteria cri) {
		
		log.info("(service)authorGetList()........" + cri);
		
		return authorMapper.authorGetList(cri);
		
	}
	
	public int authorGetTotal(Criteria cri) throws Exception {
		
		log.info("(service)authorGetTotal()........" + cri);
		
		return authorMapper.authorGetTotal(cri);
		
	}
	
	public AuthorVO authorGetDetail(int authorid) throws Exception {
		
		log.info("(service)authorGetDetail()........" + authorid);
		
		return authorMapper.authorGetDetail(authorid);
		
	}
	
	public void authorInsert(AuthorVO authorVO) throws Exception {
		
		authorMapper.authorInsert(authorVO);
		
	}
	
	public int authorModify(AuthorVO authorVO) throws Exception {
		
		log.info("(service)authorModify()........" + authorVO);
		
		return authorMapper.authorModify(authorVO);
		
	}
	
	public int authorDelete(int authorid) {
		
		log.info("(service)authorDelete()........");
		
		return authorMapper.authorDelete(authorid);
		
	}

}
