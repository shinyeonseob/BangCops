package web.controller.accuse;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.dto.BAccuse;
import web.service.face.AccuseService;
import web.service.impl.AccuseServiceImpl;


@WebServlet("/delete")
public class DeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;


	//BoardService 객체
	private AccuseService accuseService = new AccuseServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		BAccuse baccuse = accuseService.getBAccuse(req);
		
		accuseService.delete(baccuse);
		
		//목록으로 리다이렉트
		resp.sendRedirect("/board/list");
		
		
	}
	
	
	
}
