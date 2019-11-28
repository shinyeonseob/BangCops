package web.controller.member;

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

@WebServlet("/member/login")
public class MemberLoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private MemberService memberService = new MemberServiceImpl();
	HttpSession session = null;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		session = req.getSession();

		if (session.getAttribute("login") != null) { // 세션이 널이 아니면(=이미 다른아이디에 로그인되어있으면)
			System.out.println("이미 로그인 되어있음");
			System.out.println(session.getAttribute("login"));
			resp.sendRedirect("/main");
			return;	
		}// 이부분 메인 컨트롤러로 옮겨서 이미 로그인되어있으면 로그인 버튼 안보이도록 설정하기



		BUser getLoginMember = memberService.getLoginMember(req);
		
		boolean login = memberService.login(getLoginMember);

		if (login) {
			BUser getMemberByUserid = memberService.getMemberByUserid(getLoginMember);
			session.setAttribute("login", true);
			session.setAttribute("Userid", getMemberByUserid.getUserid());
			session.setAttribute("UserNick", getMemberByUserid.getUsernick());
			session.setAttribute("Userno", getMemberByUserid.getUserno());

			System.out.println("로그인 성공");
			resp.sendRedirect("/main");
		} else {
			System.out.println("로그인 실패");
			req.getRequestDispatcher("/WEB-INF/views/member/loginfail.jsp").forward(req, resp);
		}

	}

}
