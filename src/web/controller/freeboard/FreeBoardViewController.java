package web.controller.freeboard;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.dto.BAttached;
import web.dto.BBoard;
import web.service.face.BoardService;
import web.service.impl.BoardServiceImpl;

/**
 * Servlet implementation class FreeBoardViewController
 */
@WebServlet("/main/community/freeboardlist/view")
public class FreeBoardViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private BoardService boardService = new BoardServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		resp.setCharacterEncoding("UTF-8");
		
		BBoard bBoard = boardService.getIdx(req);
		
		BAttached bAttached = boardService.getFile(bBoard);
		
		//게시글 상세보기
		BBoard list = boardService.view(bBoard);
//		System.out.println("[TEST] freeBoardviewco_bBoard : " + bBoard); //테스트 완료
		
//		System.out.println("[TEST] FBViewCon : " + list); //확인완료
//		System.out.println(bAttached); //확인 완료
		req.setAttribute("list", list);
		req.setAttribute("bAttached", bAttached);
		
		
		req.getRequestDispatcher("/WEB-INF/views/board/freeboardview.jsp").forward(req, resp);
	}

}
