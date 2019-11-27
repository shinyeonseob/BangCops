package web.controller.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.Paging;
import web.service.face.MemberService;
import web.service.impl.MemberServiceImpl;

@WebServlet("/admin/memberlist")
public class AdminMemberListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private MemberService memberService = new MemberServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//요청파라미터에서 curPage를 구하고 Paging 객체 반환
		Paging paging = memberService.getPaging(req);
				
		//Paging 객체를 MODEL값으로 지정
		req.setAttribute("paging", paging);
		
		List list = memberService.getmemberList(paging);;
		
		req.setAttribute("url", req.getRequestURI());
		
		req.setAttribute("list", list);
		
		req.getRequestDispatcher("/WEB-INF/views/admin/adminmemberlist.jsp").forward(req, resp);
	}
	

}
