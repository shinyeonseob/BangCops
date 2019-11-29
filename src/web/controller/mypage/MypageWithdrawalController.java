package web.controller.mypage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import web.dto.BUser;
import web.service.face.MemberService;
import web.service.impl.MemberServiceImpl;



@WebServlet("/mypage/with")
public class MypageWithdrawalController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	MemberService memberService = new MemberServiceImpl();
	HttpSession session = null;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		session = req.getSession();
		String userid = new String();
		String userpw = new String();
		int userno = (int) session.getAttribute("Userno");
		userid = (String) session.getAttribute("Userid");
		BUser loginuser = new BUser();
		loginuser.setUserid(userid);
		loginuser.setUserno(userno);

//		System.out.println("loginuser: " + loginuser);
//		System.out.println(memberService.getMemberByUserid(loginuser).getUserpw());
//		System.out.println(memberService.getcurrpw(req).getUserpw());
		memberService.getMemberByUserid(loginuser).getUserpw();
		req.setAttribute("usercurrpw", memberService.getMemberByUserid(loginuser).getUserpw());
		
		
		//view
		req.getRequestDispatcher("/WEB-INF/views/member/mypagewithdrawal.jsp")
			.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// 세션에서 userid 받기
		session = req.getSession();
		BUser buser = new BUser();
		String userid = new String();
		userid = (String) session.getAttribute("Userid");
		int userno = (int) session.getAttribute("Userno");
		buser.setUserno(userno);
		buser.setUserid(userid);
		// 비밀번호 입력받기
		
//		System.out.println("buser : " + buser);
		
		if(memberService.getcurrpw(req).getUserpw().equals(
				memberService.getMemberByUserid(buser).getUserpw())){
			// 세션 삭제
			session = req.getSession();
			session.invalidate();
			
			//회원 삭제
			memberService.DeleteUser(buser);
			System.out.println("삭제완료");
			//view
//			resp.sendRedirect("/main");
			req.getRequestDispatcher("/WEB-INF/views/home/main.jsp")
			.forward(req, resp);
			
			
		}
				
		
		
		
		
	}
}
