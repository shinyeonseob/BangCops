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


@WebServlet("/aview")
public class ViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	//BoardService 객체
	private AccuseService accuseService = new AccuseServiceImpl();
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
	//게시글 번호 파싱
	BAccuse	viewABoard = accuseService.getBAccuse(req);
	
	//게시글 조회
	viewABoard = accuseService.view(viewABoard);
	
	//MODEL로 게시글 전달
	req.setAttribute("viewABoard", viewABoard);
	
	//첨부파일 전달
	
			
	//닉네임 전달
	req.setAttribute("nick", accuseService);
	
	//VIEW 지정
	req.getRequestDispatcher("/WEB-INF/view/accuse/accuserview.jsp")
		.forward(req, resp);
	
	
	
	}

}
