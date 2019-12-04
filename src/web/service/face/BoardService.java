package web.service.face;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import util.Paging;
import web.dto.BAttached;
import web.dto.BBoard;
import web.dto.BBoardAndBboardType;
import web.dto.BUser;
import web.dto.Bcomment;
import web.dto.Recommend;

public interface BoardService {
	public List<BBoard> getList(int boardno);
	
	//각 게시판 별 게시글 전체조회 (검색조건 포함)
	public List<BBoard> getList(Paging paging, int boardno);
	
	public List<BBoard> getSearchList(Paging paging, int boardno);
	
	public List<BBoardAndBboardType> getMyboardList(Paging paging, BUser userno);

	public Paging getPaging(HttpServletRequest req);
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
	
	//게시글 수정
	public void update(HttpServletRequest req);

	
	String getboardname(int boardno);

	public Bcomment getComment(HttpServletRequest req);

	public void insertComment(Bcomment comment);

	public List<Bcomment> getCommentList(BBoard list);

	public boolean deleteComment(Bcomment comment);
	
	public boolean isRecommend(Recommend recommend);
	
	public Recommend getRecommend(HttpServletRequest req);
	
	public boolean recommend(Recommend recommend);
	
	public int getTotalCntRecommend(Recommend recommend);

	public List<Bcomment> getMycommentList(Paging paging, BUser userno);

	public void commentMyListDelete(String names);
	
	public List<BBoard> getBoardTopFiveInFreeboard(int cnt);
	
	public List<BBoard> getBoardTopFiveInNotice(int cnt);
	
	public List<BBoard> getBoardTopFiveInReview(int cnt);

}
