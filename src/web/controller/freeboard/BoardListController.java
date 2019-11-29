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

			// 패치내용
//			Paging paging = boardService.getPaging(req);
//			
//			req.setAttribute("paging", paging);
//			
//			List<BBoard> list = boardService.getList(paging);
//			
//			req.setAttribute("url", req.getRequestURI());
//			System.out.println(req.getRequestURI());
//			req.setAttribute("list", list);
//			
//			
//			
//			req.getRequestDispatcher("/WEB-INF/views/board/freeboardList.jsp").forward(req, resp);

		
		req.setCharacterEncoding("UTF-8");

		int boardno = Integer.parseInt(req.getParameter("boardno"));
		System.out.println(boardno);
		// 요청파라미터에서 curPage 를 구하고 Paging 객체 반환
		Paging paging = boardService.getPaging(req, boardno);
		System.out.println("paging" + paging);		

		// Paging 객체를 MODEL 값으로 지정
		req.setAttribute("paging", paging);


		/*
		 * if (req.getParameter("search") != null) { String search =
		 * req.getParameter("search"); System.out.println(search);
		 * 
		 * 
		 * // 게시글 목록 조회 List<BBoardAndBboardType> list =
		 * boardService.getSearchList(paging, boardno, search);
		 * System.out.println(list);
		 * 
		 * // 게시글 목록을 MODEL값으로 지정 req.setAttribute("list", list);
		 * req.setAttribute("search", search);
		 * 
		 * 
		 * // VIEW 지정
		 * req.getRequestDispatcher("/WEB-INF/views/board/list.jsp").forward(req, resp);
		 * 
		 * return; }
		 */
		// 게시글 목록 조회
		List<BBoard> list = boardService.getList(paging, boardno);

		String boardname = boardService.getboardname(boardno);
		
		HttpSession session = req.getSession();
		
		// 게시글 목록을 MODEL값으로 지정
		System.out.println("boardno : " + boardno);
		req.setAttribute("list", list);
		req.setAttribute("boardno", boardno);
		req.setAttribute("boardname", boardname);
		req.setAttribute("Userlevel", session.getAttribute("Userlevel"));

		// VIEW 지정
		req.getRequestDispatcher("/WEB-INF/views/board/boardlist.jsp").forward(req, resp);

	

		
		
//============================내가한거==================================================================
//			Paging paging = boardService.getPaging(req);
//			
//			req.setAttribute("paging", paging);
//			
//			List<BBoard> list = boardService.getList(paging);
//			
//			req.setAttribute("list", list);
//			
//			
//			
//			req.getRequestDispatcher("/WEB-INF/views/board/freeboardList.jsp").forward(req, resp);
//======================================================================================================		


	}
	
	@Override
		protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
				
//				// 요청파라미터에서 curPage 를 구하고 Paging 객체 반환
//				Paging paging = boardService.getPaging(req);
//				System.out.println("paging" + paging);
//				String search = req.getParameter("search");
//				
//				// Paging 객체를 MODEL 값으로 지정
//				req.setAttribute("paging", paging);
//				
//				// 게시글 목록 조회
//				List<BBoard> list = boardService.getSearchList(paging, search);
//
//				// 게시글 목록을 MODEL값으로 지정
//				req.setAttribute("list", list);
//				req.setAttribute("search", search);
//
//
//				// VIEW 지정
//				req.getRequestDispatcher("/WEB-INF/views/board/list.jsp").forward(req, resp);
		}
}
