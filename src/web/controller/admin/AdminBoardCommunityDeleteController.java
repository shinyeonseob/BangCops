package web.controller.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.dto.BBoard;
import web.service.face.BoardService;
import web.service.impl.BoardServiceImpl;

@WebServlet("/admin/community/board/delete")
public class AdminBoardCommunityDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	BoardService boardService = new BoardServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		BBoard bBoard = boardService.getIdx(req);

		boardService.delete(bBoard);

		resp.sendRedirect("/admin/community/board?boardno=" + req.getParameter("boardno"));
	}

}