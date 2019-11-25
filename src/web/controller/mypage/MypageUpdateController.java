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

@WebServlet("/mypage/update")
public class MypageUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	MemberService memberService = new MemberServiceImpl();
	HttpSession session = null;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("utf-8");
		String userid = new String();
		session = req.getSession();
		
		userid = (String) session.getAttribute("loginid");
		BUser buser = new BUser();
		buser.setUserid(userid);
//		System.out.println("session id : " + userid);
//		System.out.println(buser);
		
		BUser getMemberByUserid = memberService.getMemberByUserid(buser);
		System.out.println(getMemberByUserid);
		
		
		req.setAttribute("BUser", getMemberByUserid);
		
		
		
		//view
		req.getRequestDispatcher("/WEB-INF/views/member/mypageupdate.jsp")
		.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		
		
	}
}
