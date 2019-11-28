package web.controller.freeboard;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import web.dto.BAttached;
import web.dto.BBoard;
import web.dto.Bcomment;
import web.service.face.BoardService;
import web.service.impl.BoardServiceImpl;

/**
 * Servlet implementation class FreeBoardViewController
 */
@WebServlet("/main/community/board/view")
public class BoardViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private BoardService boardService = new BoardServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		resp.setCharacterEncoding("UTF-8");
		
		BBoard bBoard = boardService.getIdx(req);
		
		BAttached bAttached = boardService.getFile(bBoard);
		
//		HttpSession session = req.getSession();
		//게시글 상세보기
		BBoard list = boardService.view(bBoard);
//		System.out.println("[TEST] freeBoardviewco_bBoard : " + bBoard); //테스트 완료
		
		
//		System.out.println("[TEST] FBViewCon : " + list); //확인완료
//		System.out.println(bAttached); //확인 완료
		req.setAttribute("list", list);
		req.setAttribute("bAttached", bAttached);
		
		
//		System.out.println(session.getAttribute("Userno"));
		System.out.println(list);
		
		
		
		// 댓글 리스트 전달
		Bcomment comment = new Bcomment();
		List<Bcomment> commentList = boardService.getCommentList(list);
		req.setAttribute("commentList", commentList);
		
		
		
		req.getRequestDispatcher("/WEB-INF/views/board/boardview.jsp").forward(req, resp);
	}

}
