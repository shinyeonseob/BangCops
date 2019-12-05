package web.controller.freeboard;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import util.Paging;
import web.dto.BBoard;
import web.dto.Recommend;
import web.service.face.BoardService;
import web.service.impl.BoardServiceImpl;

/**
 * Servlet implementation class FreeBoardListController
 */
@WebServlet("/main/community/board")
public class BoardListController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	BoardService boardService = new BoardServiceImpl();
	
	@Override
		protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		
		req.setCharacterEncoding("UTF-8");

		int boardno = Integer.parseInt(req.getParameter("boardno"));
		
		Paging paging = 
				boardService.getPaging(req, boardno);
		

		

		// Paging 객체를 MODEL 값으로 지정
		req.setAttribute("paging", paging);


		// 검색조회
		  if (req.getParameter("searchcategory") != null ) {
			  List<BBoard> list = boardService.getSearchList(paging, boardno);
			  
			  String boardname = boardService.getboardname(boardno);
			  
			  HttpSession session = req.getSession();
			  
			  // 게시글 목록을 MODEL값으로 지정
			  req.setAttribute("list", list);
			  req.setAttribute("boardno", boardno);
			  req.setAttribute("boardname", boardname);
			  req.setAttribute("Userlevel", session.getAttribute("Userlevel"));
		// 전체조회  
		  } else {
			  List<BBoard> list = boardService.getList(paging, boardno);
			  
			  String boardname = boardService.getboardname(boardno);
			  
			  HttpSession session = req.getSession();
			  
			  // 게시글 목록을 MODEL값으로 지정
			  req.setAttribute("list", list);
			  req.setAttribute("boardno", boardno);
			  req.setAttribute("boardname", boardname);
			  req.setAttribute("Userlevel", session.getAttribute("Userlevel"));
			  
		  }
		  
//		  Recommend recommend = new Recommend();
//		  
//		  int cnt = boardService.getTotalCntRecommend(recommend);
//		  req.setAttribute("reco", cnt );
		  
		  
		// 게시글 목록 조회
		


		// VIEW 지정
		req.getRequestDispatcher("/WEB-INF/views/board/boardlist.jsp").forward(req, resp);
	


	}
	
	@Override
		protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
				
		}
}
