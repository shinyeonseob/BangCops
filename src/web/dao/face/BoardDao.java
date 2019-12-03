package web.dao.face;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import util.Paging;
import web.dto.BAttached;
import web.dto.BBoard;
import web.dto.BBoardAndBboardType;
import web.dto.BUser;

public interface BoardDao {
	public List<BBoard> selectAll(int boardno);
	
	// 내림차순으로 리스트 정렬 및 게시목록 조회
	public List<BBoard> selectAll(Paging paging, int boardno);
	
	public List<BBoard> selectSearchAll(Paging paging, int boardno);
	
	public List<BBoardAndBboardType> selectMyboard(Paging paging, BUser userno);
	
	//총 게시글 수 조회
	public int selectCntAll();
	
	//검색어 키워드를 이용한 게시글 수 조회
	public int selectCntAll(String search);
	
	// Boardno로 게시글 조회
	public BBoard selectBoardByBoardno(BBoard bBoard);
	
	// 게시글 정보 DB에 INSERT (파일첨부x)
	public void insert(BBoard board);
	
	
	// 다음 게시글 번호 반환
	public int selectIdx();
	
	// 조회수 상승
	public void updateHit(BBoard bBoard);
	
	// 게시글 삭제
	public void delete(BBoard bBoard);
	
	//게시글 수정
	public void update(BBoard bBoard);
	
	public int selectCntBoard(HttpServletRequest req, int boardno);
	
	// 각 게시판 이름 반환
	public String getboardname(int boardno);
	
	public List<BBoard> selectFreeboardByReco();
	
	public List<BBoard> selectReviewByReco();
	
	public List<BBoard> selectNoticeByRegdate();
	

}
