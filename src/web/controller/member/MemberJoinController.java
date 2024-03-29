package web.controller.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.dto.BUser;
import web.service.face.MemberService;
import web.service.impl.MemberServiceImpl;

@WebServlet("/member/join2")
public class MemberJoinController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private MemberService memberService = new MemberServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		BUser bUser = memberService.getbUser(req);
		System.out.println(bUser);
		memberService.join(bUser);
		
		resp.sendRedirect("/main");
		
	}
	
}
