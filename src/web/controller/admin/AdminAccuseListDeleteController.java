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
import web.service.face.AdminAaccuseService;
import web.service.face.AdminService;
import web.service.face.BoardService;
import web.service.impl.AdminAaccuseServiceImpl;
import web.service.impl.AdminServiceImpl;
import web.service.impl.BoardServiceImpl;

/**
 * Servlet implementation class AdminAccuseListController
 */
@WebServlet("/admin/accuselistdelete")
public class AdminAccuseListDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AdminService adminService = new AdminServiceImpl();
	private AdminAaccuseService adminAaccuseService = new AdminAaccuseServiceImpl();
	private BoardService boardService = new BoardServiceImpl();

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String[] names = req.getParameter("names").split(",");
		
		if( !"".equals(names) && names != null) {
			for (String accuseno : names) {
				adminAaccuseService.aaccuseListDelete(accuseno);
			}
		}
		
		resp.sendRedirect("/admin/accuselist");
		
	}
	
	
	
}
