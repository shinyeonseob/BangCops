package web.service.face;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import util.Paging;
import web.dto.BBoard;

public interface AdminBoardService {
	
	/**
	 * 페이징 정보를 활용해 보여질 게시물 목록만 조회
	 * 
	 * @param paging
	 * @param req
	 * @return
	 */
	public List<BBoard> getList(Paging paging, HttpServletRequest req);
	
	/**
	 * 요청파라미터 curPage를 파싱한다
	 * Board TB와 curPage 값을 이용한 Paging 객체를 생성하고 반환
	 * 
	 * @param req - 요청정보 객체
	 * @return Paging - 페이징 정보
	 */	
	public Paging getPaging(HttpServletRequest req);
	
	/**
	 * 요청 파라미터 회원 번호 파싱
	 * 
	 * @param req - 요청 정보 객체
	 * @return UserAdmin - 회원 번호를 가진 객체
	 */
	public BBoard getBoardno(HttpServletRequest req);
	
	/**
	 * 게시글 삭제
	 * @param bboard
	 */

	public void deleteAdminBoard(HttpServletRequest req);

}
