package web.controller.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import web.service.face.BoardService;
import web.service.impl.BoardServiceImpl;

@WebServlet("/admin/community/board/write")
public class AdminBoardCommunityWriteController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	BoardService boardService = new BoardServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();

		req.setAttribute("userid", session.getAttribute("userid"));
		req.setAttribute("usernick", session.getAttribute("usernick"));
		req.setAttribute("boardno", req.getParameter("boardno"));

		req.getRequestDispatcher("/WEB-INF/views/admin/admincommunitywrite.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");

		int boardno = boardService.write(req);
		resp.sendRedirect("/admin/community/board?boardno=" + boardno);
	}

}
