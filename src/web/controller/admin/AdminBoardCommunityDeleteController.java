package web.controller.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.dto.BBoard;
import web.service.face.AdminCommunityService;
import web.service.face.BoardService;
import web.service.impl.AdminCommunityServiceImpl;
import web.service.impl.BoardServiceImpl;

@WebServlet("/admin/community/board/delete")
public class AdminBoardCommunityDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	AdminCommunityService adminCommunityService = new AdminCommunityServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		BBoard bBoard = adminCommunityService.getIdx(req);

		adminCommunityService.delete(bBoard);

		resp.sendRedirect("/admin/community/board?boardno=" + req.getParameter("boardno"));
	}

}
