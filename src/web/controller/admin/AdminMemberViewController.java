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

/**
 * Servlet implementation class AdminMemberViewController
 */
@WebServlet("/admin/memberview")
public class AdminMemberViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private AdminService adminService = new AdminServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		BUser viewBuser = adminService.getUserno(req);
		
		req.setAttribute("viewBuser", viewBuser);
		
		req.getRequestDispatcher("/WEB-INF/views/admin/adminmemberview.jsp").forward(req, resp);
	
	}
	

}
