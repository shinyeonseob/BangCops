package web.service.face;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import util.Paging;
import web.dto.BUser;

public interface AdminService {

	/**
	 * 회원목록 조회
	 * 
	 * @return List - 회원목록
	 */
	public List getmemberList();

	/**
	 * 페이징 정보 활용하여 보여질 회원목록 조회
	 * 
	 * @param paging - 페이징 정보
	 * @return List - 회원목록
	 */
	public List getmemberList(Paging paging);
	
	/**
	 * 요청파라미터 curPage를 파싱한다
	 * Buser TB와 curPage 값을 이용한 Paging 객체를 생성하고 반환
	 * 
	 * @param req - 요청정보 객체
	 * @return Paging - 페이징 정보
	 */
	public Paging getPaging(HttpServletRequest req);

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

	/**
	 * 회원 삭제
	 * 
	 * @param buser - 삭제할 회원 번호를 가진 객체
	 */
	public void delete(BUser buser);

	/**
	 * 회원리스트 삭제
	 * 
	 * @param names - 지울 userno를 문자열로 합친 것
	 */
	public void memberListDelete(String names);
	
}
