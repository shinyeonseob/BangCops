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

@WebServlet("/mypage/pw")
public class MypagePasswordController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	MemberService memberService = new MemberServiceImpl();
	HttpSession session = null;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

//		try {
//			if (session.getAttribute("login") == null) { // 로그인 안돼있으면 메인으로 리다이렉트
//				System.out.println("로그인이 안돼있음");
//				System.out.println(session.getAttribute("login"));
//				resp.sendRedirect("/main");
//				return;	
//			}
//		}catch(NullPointerException e){
//			System.out.println("로그인 안돼있음");
//		}

		
		// 세션에서 userid 받기
		session = req.getSession();
		String userid = new String();
		String userpw = new String();
		int userno = (int) session.getAttribute("Userno");
		userid = (String) session.getAttribute("Userid");
		BUser loginuser = new BUser();
		loginuser.setUserid(userid);
		loginuser.setUserno(userno);

//		System.out.println(memberService.getMemberByUserid(loginuser).getUserpw());
		memberService.getMemberByUserid(loginuser).getUserpw();
		req.setAttribute("usercurrpw", memberService.getMemberByUserid(loginuser).getUserpw());
		req.setAttribute("pageno", 3);
		//		System.out.println(userno);
		//		System.out.println(userid);






		//view
		req.getRequestDispatcher("/WEB-INF/views/member/mypagepw.jsp")
		.forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		session = req.getSession();
		String userid = new String();
		int userno = (int) session.getAttribute("Userno");
		userid = (String) session.getAttribute("Userid");
		BUser buser = new BUser();
		buser.setUserid(userid);
		//		System.out.println("member : " + memberService.getMemberByUserid(buser).getUserpw());
		//		buser.setUserpw(memberService.getMemberByUserid(userid));

//				System.out.println("curr : " + memberService.getcurrpw(req));
		 

		if(memberService.getcurrpw(req).getUserpw().equals(memberService.getMemberByUserid(buser).getUserpw())) {
			BUser param = memberService.getUpdatepw(req);
			param.setUserno(userno);
			//			System.out.println("param : " + param);
			memberService.updatepw(param);

		}

		//		BUser param = new BUser();
		//		System.out.println(memberService.getcurrpw(req).getUserpw());
		//		param.setUserpw(memberService.getcurrpw(req).getUserpw());

		//view
		resp.sendRedirect("/mypage/main");

	}
}
