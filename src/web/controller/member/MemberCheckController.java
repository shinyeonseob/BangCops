package web.controller.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.service.face.MemberService;
import web.service.impl.MemberServiceImpl;

/**
 * Servlet implementation class MemberCheckController
 */
@WebServlet("/member/check")
public class MemberCheckController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private MemberService memberService = new MemberServiceImpl();

	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.getRequestDispatcher("/WEB-INF/views/member/join_nickcheck.jsp").forward(req, resp);

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String usernick = req.getParameter("UserNick");
		
		if (memberService.nickcheck(usernick)) {
			req.setAttribute("nickcheck", 1);
			req.getRequestDispatcher("/WEB-INF/views/member/join_nickcheck.jsp").forward(req, resp);

		} else {
			req.setAttribute("nickcheck", 2);
			req.getRequestDispatcher("/WEB-INF/views/member/join_nickcheck.jsp").forward(req, resp);

		}
		
	}

}
