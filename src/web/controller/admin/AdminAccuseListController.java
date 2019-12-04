package web.controller.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.Paging;
import web.dto.BAccuse;
import web.dto.BAccuse2;
import web.service.face.AdminAaccuseService;
import web.service.face.AdminService;
import web.service.face.BoardService;
import web.service.impl.AdminAaccuseServiceImpl;
import web.service.impl.AdminServiceImpl;
import web.service.impl.BoardServiceImpl;

/**
 * Servlet implementation class AdminAccuseListController
 */
@WebServlet("/admin/accuselist")
public class AdminAccuseListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AdminService adminService = new AdminServiceImpl();
	private AdminAaccuseService adminAaccuseService = new AdminAaccuseServiceImpl();
	private BoardService boardService = new BoardServiceImpl();

	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 관리자 로그인일 경우
		int boardno = 6;
 
		
		if (req.getSession().getAttribute("adminlogin") != null) {

			// 요청파라미터에서 curPage를 구하고 Paging 객체 반환
			Paging paging = boardService.getPaging(req, boardno);
			paging.setSearch(req.getParameter("search"));

			System.out.println("BoardListController - " + paging);

			// Paging 객체를 MODEL값으로 지정
			req.setAttribute("paging", paging);

			// 목록 조회
			List<BAccuse2> listBAccuse = adminAaccuseService.getListBAccuse(paging);

			req.setAttribute("list", listBAccuse);
			req.setAttribute("gu", req.getParameter("gu"));

			// VIEW 지정
			req.getRequestDispatcher("/WEB-INF/views/admin/adminaccuselist.jsp").forward(req, resp);

		} else {

			// 관리자 로그인 안됐을 경우
			resp.sendRedirect("/admin/login");

		}

	}
}
