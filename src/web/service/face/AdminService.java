package web.service.face;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import util.Paging;
import web.dto.BUser;

public interface AdminService {

	public List getmemberList();

	public List getmemberList(Paging paging);
	
	public Paging getPaging(HttpServletRequest req);

	
	
	public void delete(HttpServletRequest req);
	
	public void memberListDelete(String names);

	/**
	 * 요청 파라미터 회원번호 파싱
	 * 
	 * @param req
	 * @return
	 */
	public BUser getUserno(HttpServletRequest req);

	/**
	 * 글 작성자인지 판단하기
	 * 
	 * @param req - 요청 정보 객체
	 * @return boolean - true : 로그인한 사람이 글 작성자
	 */
	public boolean checkId(HttpServletRequest req);

	/**
	 * 회원정보 상세보기
	 * 
	 * @param viewBuser - 상세보기할 userno를 가진 객체
	 * @return BUser - 상세보기할 회원정보 조회 결과
	 */
	public BUser view(BUser viewBuser);

	/**
	 * 게시글 수정
	 * 
	 * @param req - 요청 정보 객체
	 */
	public void update(HttpServletRequest req);

	
}
