package web.controller.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.dto.BAccuse;
import web.service.face.AccuseService;
import web.service.face.AdminAaccuseService;
import web.service.impl.AccuseServiceImpl;
import web.service.impl.AdminAaccuseServiceImpl;

/**
 * Servlet implementation class AdminDeleteController
 */
@WebServlet("/admin/accusedelete")
public class AdminDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AccuseService accuseService = new AccuseServiceImpl();
	private AdminAaccuseService adminAaccuseService = new AdminAaccuseServiceImpl();


	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		BAccuse baccuse = accuseService.getBAccuse(req);

		adminAaccuseService.delete(baccuse);

		// 목록으로 리다이렉트
		resp.sendRedirect("/admin/accuselist");
	}

}
