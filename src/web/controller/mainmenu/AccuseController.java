package web.controller.mainmenu;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/main/accuse")
public class AccuseController extends HttpServlet {
	private static final long serialVersionUID = 1L;


	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setAttribute("flag", 2);
		//view
		req.getRequestDispatcher("/WEB-INF/views/home/accuse.jsp")
		.forward(req, resp);
		
		
		
	}
}
