package util.Crawling.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.Crawling.dto.News;
import util.Crawling.service.face.NewsCrawlingService;
import util.Crawling.service.impl.NewsCrawlingServiceImpl;


@WebServlet("/crawling")
public class CrawlingController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	NewsCrawlingService crawling = new NewsCrawlingServiceImpl();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		
		List<News> Newslist = crawling.getCrawlingList();
		
		req.setAttribute("Newslist", Newslist);
		
		// TEST
//		for(News n : Newslist) System.out.println(n);
		


		req.getRequestDispatcher("/WEB-INF/views/home/crawling.jsp")
		.forward(req, resp);
	}
}
