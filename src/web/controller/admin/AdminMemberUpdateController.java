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
		
		// 관리자 로그인일 경우
		if (req.getSession().getAttribute("adminlogin") != null) {
		
			// 회원번호 파싱
			BUser viewBuser = adminService.getUserno(req);
		
			// 회원조회
			req.setAttribute("viewBuser", viewBuser);
		
			// VIEW 지정
			req.getRequestDispatcher("/WEB-INF/views/admin/adminmemberupdate.jsp").forward(req, resp);
		} else {
			// 관리자 로그인 안됐을 경우
            resp.sendRedirect("/admin/login");
		}
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// 한글 인코딩 설정
		req.setCharacterEncoding("UTF-8");
		
		adminService.update(req);
		
		resp.sendRedirect("/admin/memberlist");
	}

}
