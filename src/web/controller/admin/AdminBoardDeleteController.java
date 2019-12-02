package web.controller.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.dto.BBoard;
import web.service.face.AdminBoardService;
import web.service.impl.AdminBoardServiceImpl;

@WebServlet("/admin/boarddelete")
public class AdminBoardDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private AdminBoardService adminBoardService = new AdminBoardServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// 삭제할 글번호
		System.out.println(req.getParameter("idx"));
		
		adminBoardService.deleteAdminBoard(req);
		
		// 목록으로 리다이렉트
		resp.sendRedirect("/admin/memberlist");
	
	}
}
