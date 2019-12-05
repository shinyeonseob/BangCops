package web.controller.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.Paging;
import web.dto.BBoard;
import web.service.face.AdminBoardService;
import web.service.impl.AdminBoardServiceImpl;

@WebServlet("/admin/boardlist")
public class AdminBoardListController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private AdminBoardService adminBoardService = new AdminBoardServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 관리자 로그인일 경우
		if(req.getSession().getAttribute("adminlogin")!=null) {
			Paging paging = adminBoardService.getPaging(req);
	
			req.setAttribute("paging", paging);
		
			// 게시물 목록 조회
			List<BBoard> list = adminBoardService.getList(paging, req);
			
			req.setAttribute("list", list);
			req.getRequestDispatcher("/WEB-INF/views/admin/adminboardview.jsp").forward(req, resp);
		} else {

			// 관리자 로그인 안됐을 경우
			resp.sendRedirect("/admin/login");

		}

	}

}
