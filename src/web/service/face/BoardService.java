package web.service.face;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import util.Paging;
import web.dto.BBoard;
import web.dto.BBoardAndBboardType;
import web.dto.BUser;

public interface BoardService {
	
	public List<BBoard> getList();
	
	public List<BBoard> getList(Paging paging);
	
	public List<BBoardAndBboardType> getMyboardList(Paging paging, BUser userno);

	public Paging getPaging(HttpServletRequest req);
	
	//boardno로 조회해서 게시글 보기
	public BBoard view(BBoard bBoard);
}
