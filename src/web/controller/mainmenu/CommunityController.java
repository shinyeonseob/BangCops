package web.controller.mainmenu;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.dto.BBoard;
import web.service.face.BoardService;
import web.service.impl.BoardServiceImpl;


@WebServlet("/main/community")
public class CommunityController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	BoardService boardService = new BoardServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		req.setCharacterEncoding("UTF-8");
		
		//자유게시판 목록 조회(당일, 추천순)
		List<BBoard> list = boardService.getBoardTopFiveInFreeboard();
		//공지사항 목록 조회(최신순)
		List<BBoard> notice = boardService.getBoardTopFiveInNotice();
		//이용후기게시판 목록 조회(당일, 추천순)
		List<BBoard> review = boardService.getBoardTopFiveInReview();
		
		//Model값 전송
		System.out.println(list);
		req.setAttribute("freeboard", list); //자유게시판
		req.setAttribute("notice", notice); //이용후기게시판
		req.setAttribute("review", review); //공지사항
		

		//view
		req.getRequestDispatcher("/WEB-INF/views/home/community.jsp")
		.forward(req, resp);
	}
}
