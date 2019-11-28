package web.controller.freeboard;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.dto.BAttached;
import web.dto.BBoard;
import web.service.face.BoardService;
import web.service.impl.BoardServiceImpl;

/**
 * Servlet implementation class BoardUpdateController
 */
@WebServlet("/main/community/board/update")
public class BoardUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	BoardService boardService = new BoardServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		BBoard board = boardService.getIdx(req);

		BAttached bAttached = boardService.getFile(board);

		// 게시글 상세보기
		BBoard list = boardService.view(board);
//		System.out.println(list);

		// 게시글 목록을 MODEL값으로 지정
		req.setAttribute("list", list);
		req.setAttribute("bAttached", bAttached);


		req.getRequestDispatcher("/WEB-INF/views/board/boardupdate.jsp").forward(req, resp);
	}
}