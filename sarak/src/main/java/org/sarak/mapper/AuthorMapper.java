package org.sarak.mapper;

import java.util.List;

import org.sarak.domain.AuthorVO;
import org.sarak.domain.Criteria;

public interface AuthorMapper {
	
	public List<AuthorVO> authorGetList(Criteria cri);    // 작가 목록 (with 페이징)
	
	public void authorInsert(AuthorVO authorVO);    // 작가 등록
	
	public int authorGetTotal(Criteria cri);    // 작가 총 수
	
	public AuthorVO authorGetDetail(int authorid);    // 작가 상세 정보
	
	public int authorModify(AuthorVO authorVO);    // 작가 정보 수정
	
	public int authorDelete(int authorid);    // 작가 삭제

}
