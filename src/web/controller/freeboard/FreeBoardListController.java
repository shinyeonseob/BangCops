package web.controller.freeboard;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.Paging;
import web.dto.BBoard;
import web.dto.BUser;
import web.service.face.BoardService;
import web.service.impl.BoardServiceImpl;

/**
 * Servlet implementation class FreeBoardListController
 */
@WebServlet("/main/community/freeboardlist")
public class FreeBoardListController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	BoardService boardService = new BoardServiceImpl();
	
	@Override
		protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			
			Paging paging = boardService.getPaging(req);
			
			req.setAttribute("paging", paging);
			
			List<BBoard> list = boardService.getList(paging);
			
			req.setAttribute("url", req.getRequestURI());
			System.out.println(req.getRequestURI());
			req.setAttribute("list", list);
			
			
			
			req.getRequestDispatcher("/WEB-INF/views/board/freeboardList.jsp").forward(req, resp);
		
	
	}
}
