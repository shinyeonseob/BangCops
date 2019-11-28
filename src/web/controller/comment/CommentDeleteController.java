package web.controller.comment;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.dto.Bcomment;
import web.service.face.BoardService;
import web.service.impl.BoardServiceImpl;


@WebServlet("/comment/delete")
public class CommentDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BoardService boardService = new BoardServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		Bcomment comment = new Bcomment();
		
		String commentNo = (String) req.getParameter("commentno");
		
		comment.setCommentno(Integer.parseInt(commentNo));
		
		boolean success = boardService.deleteComment(comment);
		
		resp.getWriter().append("{\"success\":"+success+"}");
	}

}
