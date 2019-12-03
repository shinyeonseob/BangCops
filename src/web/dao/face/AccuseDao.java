package web.dao.face;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import util.Paging;
import web.dto.BAccuse;
import web.dto.BBoard;
import web.dto.BDeal;


public interface AccuseDao {
	
	
	/**
	 * 게시글 입력
	 * 
	 * @param board - 삽입될 게시글 내용
	 */
	public void insert(BAccuse baccuse);
	
	
	/**
	 * 다음 게시글 번호 반환
	 * 	게시글 테이블과 첨부파일 테이블에 들어갈 게시글 번호를 미리 추출
	 * 
	 * @return int
	 */
	public int selectBoardno();


	public BAccuse selectBoardByBoardno(BAccuse viewABoard);


	public void updateHit(BAccuse viewABoard);


	public int selectCntAll(String search);


	public int selectAccuseNo();


	public void insertBDeal(BDeal bDeal);


	public List<BAccuse> getSearchListBAccuse(Paging paging, HttpServletRequest req);


	public List<BBoard> selectSearchAll(Paging paging, int boardno);


	public BAccuse getbaccuse(BAccuse baccuse);


	public BDeal getBdeal(BAccuse accuse);







	

	/**
	 * 첨부파일 입력
	 * 
	 * @param boardFile - 업로드 된 첨부파일 내용
	 */
//	public void insertFile(BoardFile boardFile);
	
	/**
	 * 첨부파일 조회
	 * 
	 * @param board - 첨부파일을 조회할 게시글 객체
	 * @return BoardFile - 조회된 첨부파일
	 */
//	public BoardFile selectFile(Board board);
	
	/**
	 * 파일번호로 첨부파일 정보 조회
	 * 
	 * @param fileno - 조회할 첨부파일의 번호
	 * @return BoardFile - 조회된 첨부파일
	 */
//	public BoardFile selectByFileno(int fileno);
	
	
}


