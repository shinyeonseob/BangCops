package web.service.face;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import util.Paging;
import web.dto.BAttached;
import web.dto.BBoard;

public interface BoardService {
	
	public List<BBoard> getList();
	
	public List<BBoard> getList(Paging paging);
	
	public Paging getPaging(HttpServletRequest req);
	
	//boardno로 조회해서 게시글 보기
	public BBoard view(BBoard bBoard);
	
	//게시글 작성(파일첨부 x )
	public void write(BBoard board);
	
	//게시글 작성(파일첨부 o )
	public void write(HttpServletRequest req);
	
	public BAttached getFile(BBoard bBoard);
}
