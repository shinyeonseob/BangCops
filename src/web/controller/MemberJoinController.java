package web.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.dto.BUser;
import web.service.face.MemberService;
import web.service.impl.MemberServiceImpl;

@WebServlet("/member/join")
public class MemberJoinController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private MemberService memberService = new MemberServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 테스트
		System.out.println("/member/join");

		req.getRequestDispatcher("/WEB-INF/views/member/join.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String userid = req.getParameter("UserID");
		String userpw = req.getParameter("UserPW");
		String usernick = req.getParameter("UserNick");
		String username = req.getParameter("UserName");
		String usertel = req.getParameter("UserTel");
		
		BUser member = new BUser();
		member.setUserid(userid);
		member.setUserpw(userpw);
		member.setUsernick(usernick);
		member.setUsername(username);
		member.setUsertel(usertel);
		
		memberService.join(member);
		
		resp.sendRedirect("/main");
	}
	
}