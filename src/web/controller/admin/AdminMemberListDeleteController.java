package web.controller.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.service.face.AdminService;
import web.service.impl.AdminServiceImpl;

@WebServlet("/admin/memberlistdelete")
public class AdminMemberListDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private AdminService adminService = new AdminServiceImpl();
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String[] names = req.getParameter("names").split(",");
		
		if( !"".equals(names) && names != null) {
			for (String userno : names) {
				adminService.memberListDelete(userno);
			}
		}
		
		resp.sendRedirect("/admin/memberlist");
		
	}
}
