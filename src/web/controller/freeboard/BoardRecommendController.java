package web.controller.freeboard;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.dto.BBoard;
import web.service.face.BoardService;
import web.service.impl.BoardServiceImpl;

/**
 * Servlet implementation class BoardRecommendController
 */
@WebServlet("/main/community/board/recommend")
public class BoardRecommendController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private BoardService boardService = new BoardServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//추천한 사람 정보 얻기
		BBoard recommendParam = boardService.getRecommend(req);
		
		//추천 정보 토글
		
		boolean result = boardService.recommend(recommendParam);
	}
	
}
