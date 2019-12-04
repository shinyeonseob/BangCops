package web.controller.mainmenu;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.dto.BBoard;
import web.service.face.AccuseService;
import web.service.face.BoardService;
import web.service.impl.AccuseServiceImpl;
import web.service.impl.BoardServiceImpl;


@WebServlet("/main/home")
public class HomeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private AccuseService accuseService = new AccuseServiceImpl();
	private BoardService boardService = new BoardServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	

		req.setCharacterEncoding("utf-8");
		
		List maplist =  accuseService.getLocation();
		
		req.setAttribute("maplist", maplist);
		System.out.println(maplist);

		int cnt = 3; //미리보기 카운트 횟수
		
		List<BBoard> free = boardService.getBoardTopFiveInFreeboard(cnt); //자게 추천순으로 3개
		List<BBoard> review = boardService.getBoardTopFiveInReview(cnt); //후기게 추천순으로 3개
		List<BBoard> notice = boardService.getBoardTopFiveInNotice(cnt); //공지사항 작성일순으로 3개
		
		//모델값 보내기
		req.setAttribute("free", free);
		req.setAttribute("review", review);
		req.setAttribute("notice", notice);
		
		
		
		//view
		req.getRequestDispatcher("/WEB-INF/views/home/home.jsp")
		.forward(req, resp);
		}

}
