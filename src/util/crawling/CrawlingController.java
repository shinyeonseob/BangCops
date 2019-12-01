package util.crawling;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/crawling")
public class CrawlingController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	NewsCrawlingService crawling = new NewsCrawlingServiceImpl();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		
		List Newslist = crawling.getCrawlingList();
		System.out.println(Newslist);
		req.setAttribute("list", Newslist);
		
		req.getRequestDispatcher("/WEB-INF/views/home/home.jsp")
		.forward(req, resp);
	}
}
