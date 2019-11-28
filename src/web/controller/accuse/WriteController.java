package web.controller.accuse;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.service.face.AccuseService;
import web.service.impl.AccuseServiceImpl;



@WebServlet("/accuse/write")
public class WriteController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	//BoardService 객체
	private AccuseService accuseService = new AccuseServiceImpl();

	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		//로그인 되어있지 않으면 리다이렉트 
		if( req.getSession().getAttribute("login") == null ) {
			resp.sendRedirect("/member/join");
			return;
		}
		//신고하기 클릭하기 누르면 신고 타입에 맞게 불러오기
		req.setAttribute("accuseType",req.getParameter("accuseType"));
		
		//VIEW 지정
		req.getRequestDispatcher("/WEB-INF/views/accuse/accuseWrite.jsp")
			.forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		//작성글 삽입
		accuseService.write(req);
		
		//목록으로 리다이렉션
		resp.sendRedirect("/accuse");
	}
	
	
	
	
}
