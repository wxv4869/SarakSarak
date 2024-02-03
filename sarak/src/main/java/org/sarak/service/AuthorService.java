package org.sarak.service;

import java.util.List;

import org.sarak.domain.AuthorVO;
import org.sarak.domain.Criteria;
import org.springframework.stereotype.Service;

@Service
public interface AuthorService {

	public List<AuthorVO> authorGetList(Criteria cri) throws Exception;
	
	public int authorGetTotal(Criteria cri) throws Exception;
	
	public AuthorVO authorGetDetail(int authorid) throws Exception;
	
	public void authorInsert(AuthorVO authorVO) throws Exception;
	
	public int authorModify(AuthorVO authorVO) throws Exception;
	
	public int authorDelete(int authorid) throws Exception;
	
}
