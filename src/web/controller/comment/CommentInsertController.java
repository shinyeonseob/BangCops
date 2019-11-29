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


@WebServlet("/comment/insert")
public class CommentInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BoardService boardService = new BoardServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Bcomment comment = boardService.getComment(req);
		
		boardService.insertComment(comment);
		
		System.out.println(comment.getIdx());
		System.out.println(comment);
		resp.sendRedirect("/main/community/board/view?idx="+comment.getIdx() + "#commentbody");
	}
	
	
}
