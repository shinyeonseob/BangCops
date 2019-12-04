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

		// 관리자 로그인일 경우
		if (req.getSession().getAttribute("adminlogin") != null) {

			HttpSession session = req.getSession();

			req.setAttribute("adminloginid", session.getAttribute("adminloginid"));
			req.setAttribute("adminloginNick", session.getAttribute("adminloginNick"));
			req.setAttribute("boardno", req.getParameter("boardno"));

			req.getRequestDispatcher("/WEB-INF/views/admin/admincommunitywrite.jsp").forward(req, resp);
		} else {

			// 관리자 로그인 안됐을 경우
			resp.sendRedirect("/admin/login");

		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		System.out.println(req.getParameter("boardno"));

		int boardno = boardService.write(req);
		resp.sendRedirect("/admin/community/board?boardno=" + boardno);
	}

}
