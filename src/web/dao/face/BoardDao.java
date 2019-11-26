package web.dao.face;

import java.util.List;


import util.Paging;
import web.dto.BAttached;
import web.dto.BBoard;

public interface BoardDao {
	public List<BBoard> selectAll();
	
	// 내림차순으로 리스트 정렬 및 게시목록 조회
	public List<BBoard> selectAll(Paging paging);
	
	public int selectCntAll();
	
	// Boardno로 게시글 조회
	public BBoard selectBoardByBoardno(BBoard bBoard);
	
	// 게시글 정보 DB에 INSERT (파일첨부x)
	public void insert(BBoard board);
	
	public int selectIdx();
	
	public void updateHit(BBoard bBoard);
	
	public void delete(BBoard bBoard);
	
	
	
	
}
