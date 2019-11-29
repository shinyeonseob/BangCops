package web.controller.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.Paging;
import web.service.face.AdminService;
import web.service.impl.AdminServiceImpl;

@WebServlet("/admin/memberlist")
public class AdminMemberListController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private AdminService adminService = new AdminServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		if (req.getSession().getAttribute("adminlogin") != null) {

			// 요청파라미터에서 curPage를 구하고 Paging 객체 반환
			Paging paging = adminService.getPaging(req);
			paging.setSearch(req.getParameter("search"));

			// Paging 객체를 MODEL값으로 지정*
			req.setAttribute("paging", paging);

			// 회원 목록 조회
			List list = adminService.getmemberList(paging);

			req.setAttribute("url", req.getRequestURI());

			// 회원 목록을 MODEL값으로 지정
			req.setAttribute("list", list);

			req.getRequestDispatcher("/WEB-INF/views/admin/adminmemberlist.jsp")
			.forward(req, resp);
		}

	}
}
