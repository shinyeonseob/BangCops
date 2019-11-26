package web.controller.mypage;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.Paging;
import web.dto.BBoard;
import web.service.face.BoardService;
import web.service.impl.BoardServiceImpl;



@WebServlet("/mypage/board")
public class MypageBoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	BoardService boardService = new BoardServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		//요청파라미터에서 curPage를 구하고 Paging 객체 반환
		Paging paging = boardService.getPaging(req);
//		System.out.println("BoardListController - " + paging);
		
		//Paging 객체를 MODEL값으로 지정
		req.setAttribute("paging", paging);
		
		//게시글 목록 조회
		List<BBoard> list = boardService.getMyboardList(paging);
		
		//게시글 목록을 MODEL값으로 지정
		req.setAttribute("list", list);
		
		//VIEW 지정
		req.getRequestDispatcher("/WEB-INF/views/member/mypageboard.jsp")
			.forward(req, resp);
	}

}
