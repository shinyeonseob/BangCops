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


		
		// 한글 인코딩
		req.setCharacterEncoding("utf-8");

		// 세션에서 userid 받기
		String userid = new String();
		session = req.getSession();
		userid = (String) session.getAttribute("Userid");
		int userno = (int) session.getAttribute("Userno");
		// BUser 객체에 userid 넣기
		BUser buser = new BUser();
		buser.setUserid(userid);
		buser.setUserno(userno);
		System.out.println("session id : " + userid);
		System.out.println(buser);

		// userid 에 해당하는 사용자 데이터 가져오기
		BUser getMemberByUserid = memberService.getMemberByUserid(buser);
		System.out.println(getMemberByUserid);


		// 모델 값 뷰로 전달
		req.setAttribute("BUser", getMemberByUserid);


		//view
		req.getRequestDispatcher("/WEB-INF/views/member/mypageupdate.jsp")
		.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");

		// 파일업로드 까지 
		//memberService.update(req);
		
		BUser buser = new BUser();
		buser = memberService.getupdateUser(req);
		int userno = (int) session.getAttribute("Userno");
		buser.setUserno(userno);
		System.out.println("reqUpdate : " + buser);
		memberService.update( buser);
		
//		memberService.update(buser);

		resp.sendRedirect("/mypage/main");	


	}
}
