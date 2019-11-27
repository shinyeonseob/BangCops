package web.service.face;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import util.Paging;
import web.dto.BAttached;
import web.dto.BBoard;
import web.dto.BBoardAndBboardType;
import web.dto.BUser;
import web.dto.Bcomment;

public interface BoardService {
	
	public List<BBoard> getList();
	
	public List<BBoard> getList(Paging paging, int boardno);
	
	public List<BBoardAndBboardType> getMyboardList(Paging paging, BUser userno);

	public Paging getPaging(HttpServletRequest req ,int boardno);
	
	//boardno로 조회해서 게시글 보기
	public BBoard view(BBoard bBoard);
	
	//게시글 작성(파일첨부 x )
	public void write(BBoard board);
	
	//게시글 작성(파일첨부 o )
	public int write(HttpServletRequest req);
	
	public BAttached getFile(BBoard bBoard);
	
	//게시판 idx 추출
	public BBoard getIdx(HttpServletRequest req);
	
	//게시글 삭제
	public void delete(BBoard bBoard);

	
	String getboardname(int boardno);

	public Bcomment getComment(HttpServletRequest req);

	public void insertComment(Bcomment comment);

	public List<Bcomment> getCommentList(BBoard list);

	public boolean deleteComment(Bcomment comment);
}
