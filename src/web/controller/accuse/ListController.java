package web.controller.accuse;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.Paging;
import web.service.face.AccuseService;
import web.service.face.BoardService;
import web.service.impl.AccuseServiceImpl;
import web.service.impl.BoardServiceImpl;




//BoardService 객체
@WebServlet("/accuselist")
public class ListController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private AccuseService accuseService = new AccuseServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//요청파라미터에서 curPage를 구하고 Paging 객체 반환
		Paging paging = accuseService.getPaging(req);
		System.out.println("BoardListController - " + paging);
		
		//Paging 객체를 MODEL값으로 지정
		req.setAttribute("paging", paging);
		
		//게시글 목록 조회
		
		List list = accuseService.getList(paging);
		
		//게시글 목록을 MODEL값으로 지정
		
		
		// VIEW 지정
		req.getRequestDispatcher("/WEB-INF/views/accuse/accuseList.jsp")
		.forward(req, resp);

	
	}
	

}
