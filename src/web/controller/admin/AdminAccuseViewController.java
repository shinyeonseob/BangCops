package web.controller.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.dto.BAccuse;
import web.dto.BAccuse2;
import web.dto.BDeal;
import web.service.face.AccuseService;
import web.service.face.AdminAaccuseService;
import web.service.face.AdminService;
import web.service.face.BoardService;
import web.service.impl.AccuseServiceImpl;
import web.service.impl.AdminAaccuseServiceImpl;
import web.service.impl.AdminServiceImpl;
import web.service.impl.BoardServiceImpl;

/**
 * Servlet implementation class AdminAccuseViewController
 */
@WebServlet("/admin/accuseview")
public class AdminAccuseViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private AdminService adminService = new AdminServiceImpl();
	private AdminAaccuseService adminAaccuseService = new AdminAaccuseServiceImpl();
	private BoardService boardService = new BoardServiceImpl();
	private AccuseService accuseService = new AccuseServiceImpl();

	
	@Override
		protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			
		int boardno = 6;

		BAccuse2 bAccuse2 = adminAaccuseService.getbAccuse2(req);
		BAccuse accuse = new BAccuse();
		accuse.setAccuseno(bAccuse2.getAccuseno());
		BDeal bDeal = accuseService.getBdeal(accuse);
		
		req.setAttribute("bAccuse2", bAccuse2);
		req.setAttribute("bDeal", bDeal);

		
		req.getRequestDispatcher("/WEB-INF/views/admin/adminaccuseview.jsp").forward(req, resp);

				
		}

}
