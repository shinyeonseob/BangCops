package web.controller.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.dto.BAttached;
import web.dto.BBoard;
import web.service.face.AdminCommunityService;
import web.service.face.BoardService;
import web.service.impl.AdminCommunityServiceImpl;
import web.service.impl.BoardServiceImpl;

@WebServlet("/admin/community/board/update")
public class AdminBoardCommunityUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	AdminCommunityService adminCommunityService = new AdminCommunityServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// 관리자 로그인일 경우
		if (req.getSession().getAttribute("adminlogin") != null) {
			BBoard board = adminCommunityService.getIdx(req);

			board = adminCommunityService.view(board);

			req.setAttribute("board", board);

			BAttached bAttached = adminCommunityService.getFile(board);
			req.setAttribute("bAttached", bAttached);

			// 게시글 목록을 MODEL값으로 지정

			req.getRequestDispatcher("/WEB-INF/views/admin/admincommunityupdate.jsp").forward(req, resp);
		} else {

			// 관리자 로그인 안됐을 경우
			resp.sendRedirect("/admin/login");

		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");

		adminCommunityService.update(req);

		resp.sendRedirect("/admin/community");
	}
}
