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

@WebServlet("/admin/memberupdate")
public class AdminMemberUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private AdminService adminService = new AdminServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		if(!adminService.checkId(req)) {
			resp.sendRedirect("/admin/memberlist");
			return;
		}
		
		// 회원번호 파싱
		BUser viewBuser = adminService.getUserno(req);
		
		// 회원조회
		viewBuser = adminService.view(viewBuser);
		
		// VIEW 지정
		req.getRequestDispatcher("/WEB-INF/views/admin/adminmemberupdate").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// 한글 인코딩 설정
		req.setCharacterEncoding("UTF-8");
		adminService.update(req);
		resp.sendRedirect("/admin/memberlist");
	}

}
