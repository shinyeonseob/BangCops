package web.dao.face;

import java.util.List;

import util.Paging;
import web.dto.BBoard;

public interface BoardDao {
	public List<BBoard> selectAll();
	
	public List<BBoard> selectAll(Paging paging);
	
	public int selectCntAll();
}
