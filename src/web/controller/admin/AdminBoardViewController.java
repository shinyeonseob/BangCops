package web.controller.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.dto.BUser;
import web.service.face.AdminService;
import web.service.impl.AdminServiceImpl;

@WebServlet("/admin/boardview")
public class AdminBoardViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private AdminService adminService = new AdminServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 관리자 로그인일 경우
		if (req.getSession().getAttribute("adminlogin") != null) {

		BUser viewBuser = adminService.getUserno(req);
		
		req.setAttribute("viewBuser", viewBuser);
		
		req.getRequestDispatcher("/WEB-INF/views/admin/adminmemberview.jsp").forward(req, resp);
	
		} else {
			// 관리자 로그인 안됐을 경우
            resp.sendRedirect("/admin/login");
		}
		
	}
	
}