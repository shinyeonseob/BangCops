package web.controller.mypage;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import util.Paging;
import web.dto.BUser;
import web.dto.Bcomment;
import web.service.face.BoardService;
import web.service.face.MemberService;
import web.service.impl.BoardServiceImpl;
import web.service.impl.MemberServiceImpl;

@WebServlet("/mypage/comment")
public class MypageCommentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	BoardService boardService = new BoardServiceImpl();
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
		req.setCharacterEncoding("UTF-8");
		
		
		// 요청파라미터에서 curPage 를 구하고 Paging 객체 반환
		Paging paging = boardService.getPaging(req);
		// Paging 객체를 MODEL 값으로 지정
		req.setAttribute("paging", paging);	
		
		
		session = req.getSession();
		String userid = new String();
		
		userid = (String) session.getAttribute("Userid");
		BUser buser = new BUser();
		buser.setUserid(userid);
		int user ;
		user = 
		memberService.getMemberByUserid(buser).getUserno();
//		System.out.println(user);
		BUser userno = new BUser();
		userno.setUserno(user);
		
		// 댓글 목록 조회
		List<Bcomment> list = boardService.getMycommentList(paging, userno);
		
		
		
		req.setAttribute("list", list);
		
		
		
		
		//view
		req.getRequestDispatcher("/WEB-INF/views/member/mypagecomment.jsp")
		.forward(req, resp);
	
	}

}
