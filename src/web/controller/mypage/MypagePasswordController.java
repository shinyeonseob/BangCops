package web.controller.mypage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.service.face.MemberService;
import web.service.impl.MemberServiceImpl;

@WebServlet("/mypage/pw")
public class MypagePasswordController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	MemberService memberService = new MemberServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		
		
		//view
		req.getRequestDispatcher("/WEB-INF/views/member/mypagepw.jsp")
		.forward(req, resp);
	}
}
