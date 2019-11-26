package web.dao.face;

import java.util.List;

import util.Paging;
import web.dto.BBoard;
import web.dto.BBoardAndBboardType;
import web.dto.BUser;

public interface BoardDao {
	public List<BBoard> selectAll();
	
	public List<BBoard> selectAll(Paging paging);
	
	public List<BBoardAndBboardType> selectMyboard(Paging paging, BUser userno);

	public int selectCntAll();
	
	public BBoard selectBoardByBoardno(BBoard bBoard);
}
