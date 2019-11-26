package web.controller.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import web.dto.Admin;
import web.service.face.AdminMemberService;
import web.service.impl.AdminMemberServiceImpl;

/**
 * Servlet implementation class AdminLoginController
 */
@WebServlet("/admin/login")
public class AdminLoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private AdminMemberService adminMemberService = new AdminMemberServiceImpl();
	HttpSession session = null;

	@Override
		protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		System.out.println("/login");

		
		req.getRequestDispatcher("/WEB-INF/views/admin/adminlogin.jsp").forward(req, resp);
		
		}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		session = req.getSession();

		if (session.getAttribute("login") != null) { // 세션이 널이 아니면(=이미 다른아이디에 로그인되어있으면)
			System.out.println("이미 로그인 되어있음");
			System.out.println(session.getAttribute("login"));
			resp.sendRedirect("/main");
			return;
		}	// 이부분 메인 컨트롤러로 옮겨서 이미 로그인되어있으면 로그인 버튼 안보이도록 설정하기

		Admin admin = adminMemberService.getLoginAdmin(req);
		
		boolean login = adminMemberService.login(admin);

		if (login) {
			Admin getAdminByid = adminMemberService.getAdminByid(admin);
			session.setAttribute("login", true);
			session.setAttribute("loginid", getAdminByid.getAdminid());
			session.setAttribute("loginNick", getAdminByid.getAdminnick());

			System.out.println("로그인 성공");
			req.getRequestDispatcher("/WEB-INF/views/admin/admin_main.jsp").forward(req, resp);		} else {
			System.out.println("로그인 실패");
			resp.sendRedirect("/admin/login");
		}

	}

}


