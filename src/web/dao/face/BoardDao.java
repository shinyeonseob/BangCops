package web.dao.face;

import java.util.List;

import util.Paging;
import web.dto.BAttached;
import web.dto.BBoard;

public interface BoardDao {
	public List<BBoard> selectAll();
	
	public List<BBoard> selectAll(Paging paging);
	
	public int selectCntAll();
	
	// Boardno로 게시글 조회
	public BBoard selectBoardByBoardno(BBoard bBoard);
	
	// 게시글 정보 DB에 INSERT (파일첨부x)
	public void insert(BBoard board);
	
	public int selectIdx();
	
	public void insertFile(BAttached bAttached);
	
	public BAttached selectFile(BBoard bBoard);
}
