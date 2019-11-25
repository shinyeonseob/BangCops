package web.service.face;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import util.Paging;
import web.dto.BBoard;

public interface BoardService {
	
	public List<BBoard> getList();
	
	public List<BBoard> getList(Paging paging);
	
	public Paging getPaging(HttpServletRequest req);
}
