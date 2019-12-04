package web.service.impl;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import util.Paging;
import web.dao.face.BoardDao;
import web.dao.face.BoardFileDao;
import web.dao.face.CommentDao;
import web.dao.face.RecommendDao;
import web.dao.impl.BoardDaoImpl;
import web.dao.impl.BoardFileDaoImpl;
import web.dao.impl.CommentDaoImpl;
import web.dao.impl.RecommendDaoImpl;
import web.dto.BAttached;
import web.dto.BBoard;
import web.dto.BBoardAndBboardType;
import web.dto.BUser;
import web.dto.Bcomment;
import web.dto.Recommend;
import web.service.face.BoardService;

public class BoardServiceImpl implements BoardService {

	private BoardDao boardDao = new BoardDaoImpl();
	private BoardFileDao boardFileDao = new BoardFileDaoImpl();
	private CommentDao commentDao = new CommentDaoImpl();
	private RecommendDao recommendDao = new RecommendDaoImpl();

	@Override
	public List<BBoard> getList(int boardno) {
		return boardDao.selectAll(boardno);
	}

	@Override
	public List<BBoard> getList(Paging paging, int boardno) {
		return boardDao.selectAll(paging, boardno);
	}
	
	@Override
	public List<BBoard> getSearchList(Paging paging, int boardno) {
		return boardDao.selectSearchAll(paging, boardno);
	}

	@Override
	public Paging getPaging(HttpServletRequest req) {
		// 요청파라미터 curPage를 파싱한다.
		String param = req.getParameter("curPage");
		int curPage = 0;
		if (param != null && !"".equals(param)) {
			curPage = Integer.parseInt(param);
		}
		// System.out.println("curPage : " + curPage);
		
		// Board TB와 curPage 값을 이용한 Paging 객체를 생성하고 반환
		int totalCount = boardDao.selectCntAll();

		// paging 객체 생성
		Paging paging = new Paging(totalCount, curPage);

		return paging;
	}

	@Override
	public Paging getPaging(HttpServletRequest req, int boardno) {
		// 요청파라미터 curPage를 파싱한다.
		String param = req.getParameter("curPage");
		int curPage = 0;
		if (param != null && !"".equals(param)) {
			curPage = Integer.parseInt(param);
		}
		// System.out.println("curPage : " + curPage);
		
		
		
		// Board TB와 curPage 값을 이용한 Paging 객체를 생성하고 반환
		int totalCount = boardDao.selectCntBoard(req, boardno);

		// paging 객체 생성
		Paging paging = new Paging(totalCount, curPage);
		
		paging.setSearchcategory(req.getParameter("searchcategory"));
		paging.setSearchtarget(req.getParameter("searchtarget"));

		return paging;
	}

	@Override
	public BBoard view(BBoard bBoard) {
		boardDao.updateHit(bBoard);
		return boardDao.selectBoardByBoardno(bBoard);
	}

	@Override
	public List<BBoardAndBboardType> getMyboardList(Paging paging, BUser userno) {
//		System.out.println("service test : " + boardDao.selectMyboard(paging, userno));
		return boardDao.selectMyboard(paging, userno);
	}

	public void write(BBoard board) {
		boardDao.insert(board);

	}

	@Override
	public int write(HttpServletRequest req) {
		// 파일 업로드 형태의 데이터가 맞는지 확인
		// = 멀티파트/폼데이터가 맞는지 확인
		boolean isMultipart = false;
		isMultipart = ServletFileUpload.isMultipartContent(req);

		if (!isMultipart) {
			System.out.println("멀티파트 아님");
			return 0;
		}

		// 업로드된 파일을 디스크에 임시 저장하고 후처리한다.
		DiskFileItemFactory factory = null;
		factory = new DiskFileItemFactory();

		// 파일 사이즈가 1메가 보다 작을경우 메모리에서 처리
		int maxMem = 1 * 1024 * 1024; // 1MB
		factory.setSizeThreshold(maxMem);

		// 용량이 1메가이상 10메가 이하일 경우 임시파일을 만들어서 처리
		ServletContext context = req.getServletContext();
		String path = context.getRealPath("tmp");

		File repository = new File(path);

		factory.setRepository(repository);

		// 업로드 허용 용량기준(10메가)를 넘지 않을 경우에만 업로드 하도록 처리
		int maxFile = 10 * 1024 * 1024; // 10MB

		// 업로드 객체 생성
		ServletFileUpload upload = null;
		upload = new ServletFileUpload(factory);

		// 파일 업로드 용량 제한 설정 : 10MB
		upload.setFileSizeMax(maxFile);

		// 여기까지 파일 업로드 준비 및 완료

		// 6. 업로드된 데이터 추출(파싱)
		// 임시 파일 업로드도 같이 수행함
		List<FileItem> items = null;
		try {
			items = upload.parseRequest(req);
		} catch (FileUploadException e) {
			e.printStackTrace();
		}

		Iterator<FileItem> iter = items.iterator();
		BBoard board = new BBoard();
		BAttached bAttached = null;

		while (iter.hasNext()) {
			FileItem item = iter.next();

			// 1)빈 파일 처리
			if (item.getSize() <= 0)
				continue;

			// 2) 일반적인 요청 데이터 처리
			if (item.isFormField()) {

				// key값에 따라 처리방식 다르게 하기
				String key = item.getFieldName();

				// Board board = new Board();

				if ("title".equals(key)) {
					try {
						board.setTitle(item.getString("UTF-8"));
					} catch (UnsupportedEncodingException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}

				} else if ("contents".equals(key)) {

					try {
						board.setContents(item.getString("UTF-8"));
					} catch (UnsupportedEncodingException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}

				} else if ("boardno".equals(key)) {
					try {
						board.setBoardNo(Integer.parseInt(item.getString("UTF-8")));
					} catch (NumberFormatException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (UnsupportedEncodingException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}

			} else { // 3) 파일처리
				bAttached = new BAttached();

				UUID uuid = UUID.randomUUID(); // 랜덤 UID 생성

				// 12자리 uid 얻기
				String u = uuid.toString().split("-")[4];
				// ---------------------------------

				// 로컬 파일 저장소에 파일 저장하기

				// 로컬 저장소 파일 객체
				File up = new File(context.getRealPath("upload"), item.getName() + "_" + u);

				bAttached.setOriginName(item.getName());
				bAttached.setStoredName(item.getName() + "_" + u);
				bAttached.setFilesize(item.getSize());
				bAttached.setFileRoot(path);
				// bAttached.setIdx(boardDao.selectIdx());
				try {
					item.write(up); // 실제 업로드
					item.delete(); // 임시 파일 삭제
				} catch (Exception e) {
					e.printStackTrace();
				}

				// - - - - - - - - - - - - - - - -

			} // 파일처리 if
		} // 요청파라미터 처리 while

		int idx = boardDao.selectIdx();

		HttpSession session = req.getSession();

		if(session.getAttribute("adminlogin").equals(true)) {
			board.setUsernick((String) session.getAttribute("adminloginNick"));
			board.setIdx(idx);
		}else {
			board.setUsernick((String) session.getAttribute("UserNick"));
			board.setUserNo((int) session.getAttribute("Userno"));
			board.setIdx(idx);
		}
		boardDao.insert(board);

		if (bAttached != null && bAttached.getFilesize() != 0) {
			bAttached.setIdx(idx);
			boardFileDao.insertFile(bAttached);

			// System.out.println(bAttached);
		}
		return board.getBoardNo();
	}

	@Override
	public BAttached getFile(BBoard bBoard) {
		return boardFileDao.selectFile(bBoard);
	}

	@Override
	public BBoard getIdx(HttpServletRequest req) {
		String param = req.getParameter("idx");

		int idx = 0;
		if (param != null && !"".equals(param)) {
			idx = Integer.parseInt(param);
		}
		BBoard bBoard = new BBoard();
		bBoard.setIdx(idx);
		return bBoard;
	}

	@Override
	public void delete(BBoard bBoard) {
		boardDao.delete(bBoard);
	}
	
	@Override
	public void update(HttpServletRequest req) {
		BBoard board = null;
		BAttached boardFile = null;
		
		boolean isMultipart = ServletFileUpload.isMultipartContent(req);
		
		if(!isMultipart) {
			//파일 첨부가 없을 경우
			board = new BBoard();
			
			board.setTitle(req.getParameter("title"));
			board.setUserid((String) req.getSession().getAttribute("userid"));
			board.setContents(req.getParameter("contents"));
			
		} else {
			//파일업로드를 사용하고 있을 경우
			board = new BBoard();

			//디스크팩토리
			DiskFileItemFactory factory = new DiskFileItemFactory();

			//메모리처리 사이즈
			factory.setSizeThreshold(1 * 1024 * 1024); //1MB

			//임시 저장소
			File repository=new File(req.getServletContext().getRealPath("tmp"));
			factory.setRepository(repository);
			
			//업로드 객체 생성
			ServletFileUpload upload = new ServletFileUpload(factory);
			
			//용량 제한 설정 : 10MB
			upload.setFileSizeMax(10 * 1024 * 1024);
			
			//form-data 추출 
			List<FileItem> items = null;
			try {
				items = upload.parseRequest(req);
				
			} catch (FileUploadException e) {
				e.printStackTrace();
			}
			
			//파싱된 데이터 처리 반복자
			Iterator<FileItem> iter = items.iterator();
			
			//요청정보 처리
			while( iter.hasNext() ) {
				FileItem item = iter.next();
				
				// 빈 파일 처리
				if( item.getSize() <= 0 )	continue;
				
				// 빈 파일이 아닐 경우
				if( item.isFormField() ) {
					try {
						if( "idx".equals( item.getFieldName() ) ) {
							board.setIdx( Integer.parseInt(item.getString()) );
						}
	
						if( "title".equals( item.getFieldName() ) ) {
							board.setTitle( item.getString("utf-8") ); 
						}
						if( "contents".equals( item.getFieldName() ) ) {
							board.setContents( item.getString("utf-8") );
						}
						if( "boardno".equals( item.getFieldName() ) ) {
							board.setBoardNo(Integer.parseInt(item.getString()) );
						}
						board.setUserid((String) req.getSession().getAttribute("userid"));
					} catch (UnsupportedEncodingException e) {
						e.printStackTrace();
					}
					
				} else {
					UUID uuid = UUID.randomUUID();
					String u = uuid.toString().split("-")[4];

					//로컬 저장소 파일
					String stored = item.getName() + "_" + u;
					File up = new File(
						req.getServletContext().getRealPath("upload")
						, stored);
					
					boardFile = new BAttached();
					boardFile.setOriginName(item.getName());
					boardFile.setStoredName(stored);
					boardFile.setFilesize(item.getSize());
					
					try {
						// 실제 업로드
						item.write(up);
						
						// 임시 파일 삭제
						item.delete();
						
					} catch (Exception e) {
						e.printStackTrace();
					} // try end
				} //if end
			} //while end
		} //if(!isMultipart) end
		

//		System.out.println(board);
//		System.out.println(boardFile);
		
		if(board != null) {
			System.out.println(board);
			boardDao.update(board);
		}
		
		if(boardFile != null) {
			boardFile.setIdx(board.getIdx());
			System.out.println(boardFile);
			boardFileDao.insertFile(boardFile);
		}
	}

	@Override
	public String getboardname(int boardno) {
		// TODO Auto-generated method stub
		return boardDao.getboardname(boardno);
	}

	public Bcomment getComment(HttpServletRequest req) {

		try {
			req.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		String idx = (String) req.getParameter("idx");
		String userno = (String) req.getParameter("userno");
		String contents = (String) req.getParameter("contents");
		// Date regdate = (Date) req.getParameter("regDate");

		Bcomment comment = new Bcomment();
		comment.setIdx(Integer.parseInt(idx));
		comment.setUserno(Integer.parseInt(userno));
		comment.setContents(contents);

		return comment;
	}

	@Override
	public void insertComment(Bcomment comment) {
		commentDao.insertComment(comment);
	}

	@Override
	public List<Bcomment> getCommentList(BBoard list) {
		return commentDao.selectComment(list);
	}

	@Override
	public boolean deleteComment(Bcomment comment) {
		commentDao.deleteComment(comment);

		if (commentDao.countComment(comment) > 0) {
			return false;
		} else {
			return true;
		}
	}

	@Override
	public Recommend getRecommend(HttpServletRequest req) {

		// 전달파라미터 파싱
		int idx = 0;
		String param = req.getParameter("idx");
		if (param != null && !"".equals(param)) {
			idx = Integer.parseInt(param);
		}

		// 로그인한 유저의 아이디
		int userno = (int) req.getSession().getAttribute("Userno");

		Recommend recommend = new Recommend();
		recommend.setIdx(idx);
		recommend.setUserno(userno);

		return recommend;
	}

	@Override
	public boolean recommend(Recommend recommend) {
		if( isRecommend(recommend) ) {
			recommendDao.deleteRecommend(recommend);
			
			return false;
		} else {
			recommendDao.insertRecommend(recommend);
			
			return true;
		}
	}
	
	@Override
	public int getTotalCntRecommend(Recommend recommend) {
		return recommendDao.selectTotalCntRecommend(recommend);
	}
	
	@Override
	public boolean isRecommend(Recommend recommend) {
		int cnt = recommendDao.selectCntRecommend(recommend);
		
		if(cnt > 0) { //추천했음
			return true;
			
		} else { //추천하지 않았음
			return false;
			
		}
	}


	@Override
	public List<Bcomment> getMycommentList(Paging paging, BUser userno) {
		
		return commentDao.selectMycomment(paging, userno);
	}

	

	@Override
	public void commentMyListDelete(String names) {
		commentDao.deleteCommentList(names);
		
	}

	@Override
	public List<BBoard> getBoardTopFiveInFreeboard() {
		return boardDao.selectFreeboardByReco();
	}

	@Override
	public List<BBoard> getBoardTopFiveInReview() {
		return boardDao.selectReviewByReco();
	}
	
	@Override
	public List<BBoard> getBoardTopFiveInNotice() {
		return boardDao.selectNoticeByRegdate();
	}


	


//	@Override
//	public boolean recommend(BBoard recommend) {
//		if( isRecommend(recommend) ) { //추천한 상태
//			recommendDao.deleteRecommend(recommend);
//			
//			return false;
//			
//		} else { //추천하지 않은 상태
//			recommendDao.insertRecommend(recommend);
//			
//			return true;
//			
//		}
//	}

//	@Override
//	public boolean isRecommend(BBoard recommend) {
//int cnt = recommendDao.selectCntRecommend(recommend);
//		
//		if(cnt > 0) { //추천했음
//			return true;
//			
//		} else { //추천하지 않았음
//			return false;
//			
//		}
//	}
	
	

}
