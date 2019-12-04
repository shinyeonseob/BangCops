package web.controller.mainmenu;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.service.face.AccuseService;
import web.service.impl.AccuseServiceImpl;


@WebServlet("/main/home")
public class HomeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private AccuseService accuseService = new AccuseServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	

		req.setCharacterEncoding("utf-8");
		
		List maplist =  accuseService.getLocation();
		
		req.setAttribute("maplist", maplist);
//		System.out.println(maplist);

		//view
		req.getRequestDispatcher("/WEB-INF/views/home/home.jsp")
		.forward(req, resp);
		}

}
