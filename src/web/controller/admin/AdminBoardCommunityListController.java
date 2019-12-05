package web.controller.admin;

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
import web.dto.Recommend;
import web.service.face.AdminCommunityService;
import web.service.face.BoardService;
import web.service.impl.AdminCommunityServiceImpl;
import web.service.impl.BoardServiceImpl;

@WebServlet("/admin/community/board")
public class AdminBoardCommunityListController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	AdminCommunityService adminCommunityService = new AdminCommunityServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// 관리자 로그인일 경우
		if (req.getSession().getAttribute("adminlogin") != null) {

			req.setCharacterEncoding("UTF-8");

			int boardno = Integer.parseInt(req.getParameter("boardno"));

			Paging paging = adminCommunityService.getPaging(req, boardno);

			// Paging 객체를 MODEL 값으로 지정
			req.setAttribute("paging", paging);

			if (req.getParameter("searchcategory") != null) {
				List<BBoard> list = adminCommunityService.getSearchList(paging, boardno);

				String boardname = adminCommunityService.getboardname(boardno);

				HttpSession session = req.getSession();

				// 게시글 목록을 MODEL값으로 지정
				req.setAttribute("list", list);
				req.setAttribute("boardno", boardno);
				req.setAttribute("boardname", boardname);
				req.setAttribute("Userlevel", session.getAttribute("Userlevel"));

			} else {
				List<BBoard> list = adminCommunityService.getList(paging, boardno);

				String boardname = adminCommunityService.getboardname(boardno);

				HttpSession session = req.getSession();

				// 게시글 목록을 MODEL값으로 지정
				req.setAttribute("list", list);
				req.setAttribute("boardno", boardno);
				req.setAttribute("boardname", boardname);
				req.setAttribute("Userlevel", session.getAttribute("Userlevel"));

			}

			Recommend recommend = new Recommend();

			int cnt = adminCommunityService.getTotalCntRecommend(recommend);
			req.setAttribute("reco", cnt);

			// 게시글 목록 조회

			// VIEW 지정
			req.getRequestDispatcher("/WEB-INF/views/admin/admincommunitylist.jsp").forward(req, resp);
		} else {

			// 관리자 로그인 안됐을 경우
			resp.sendRedirect("/admin/login");

		}

	}

}
