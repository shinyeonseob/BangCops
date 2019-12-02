package web.dao.face;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import util.Paging;
import web.dto.BBoard;

public interface AdminBoardDao {

	/**
	 * 페이징 대상 게시글 목록 조회
	 * @param paging-페이징 조회
	 * @return List -조회된 회원 게시물 목록
	 */
	List<BBoard> selecAll(Paging paging, HttpServletRequest req);

	/**
	 * 총 게시글 수 조회
	 * 
	 * @return
	 */
	int selectCntAll(HttpServletRequest req);

	/**
	 * 게시글 번호를 통해 게시글 불러오기
	 * 
	 * @param req
	 * @return
	 */
	BBoard selecBoardByBoardno(HttpServletRequest req);

	/**
	 * 게시글 삭제
	 * 
	 * @param string - 삭제할 겟글 번호를 담은 객체
	 */
	void deleteAdminBoard(String string);

}
