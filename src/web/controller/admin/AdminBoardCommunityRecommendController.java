package web.controller.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.dto.Recommend;
import web.service.face.BoardService;
import web.service.impl.BoardServiceImpl;

@WebServlet("/admin/community/board/recommend")
public class AdminBoardCommunityRecommendController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private BoardService boardService = new BoardServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// 추천한 사람 정보 얻기
		Recommend recommendParam = boardService.getRecommend(req);

		// 추천 정보 토글
		boolean result = boardService.recommend(recommendParam);

		int cnt = boardService.getTotalCntRecommend(recommendParam);

		// 결과 JSON 응답

		resp.getWriter().println("{\"result\": " + result + ", \"cnt\": " + cnt + "}");
	}

}
