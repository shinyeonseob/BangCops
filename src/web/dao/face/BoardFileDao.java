package web.dao.face;

import web.dto.BAttached;
import web.dto.BBoard;

public interface BoardFileDao {

	public void insertFile(BAttached bAttached);
	
	public BAttached selectFile(BBoard bBoard);
}
