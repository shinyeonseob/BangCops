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
import web.dto.BBoard;
import web.dto.BBoardAndBboardType;
import web.dto.BUser;
import web.service.face.BoardService;
import web.service.face.MemberService;
import web.service.impl.BoardServiceImpl;
import web.service.impl.MemberServiceImpl;



@WebServlet("/mypage/board")
public class MypageBoardController extends HttpServlet {
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
		
		//요청파라미터에서 curPage를 구하고 Paging 객체 반환
		Paging paging = boardService.getPaging(req);
		
		
		req.setAttribute("paging", paging);
		
		
		session = req.getSession();
		String userid = new String();
		
		userid = (String) session.getAttribute("Userid");
		BUser buser = new BUser();
		buser.setUserid(userid);
		int user ;
		user = 
		memberService.getMemberByUserid(buser).getUserno();
		System.out.println(user);
		BUser userno = new BUser();
		userno.setUserno(user);
		System.out.println(userno);
		//게시글 목록 조회
		List<BBoardAndBboardType> list = boardService.getMyboardList(paging, userno);

//		System.out.println("test userno : " + userno);
//		System.out.println("test list : " + list);
		//게시글 목록을 MODEL값으로 지정
		req.setAttribute("list", list);
		req.setAttribute("pageno", 4);
		//VIEW 지정
		req.getRequestDispatcher("/WEB-INF/views/member/mypageboard.jsp")
			.forward(req, resp);
	}

}
