package web.controller.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.dto.BAttached;
import web.dto.BBoard;
import web.dto.Bcomment;
import web.dto.Recommend;
import web.service.face.AdminCommunityService;
import web.service.impl.AdminCommunityServiceImpl;

@WebServlet("/admin/community/board/view")
public class AdminBoardCommunityViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	AdminCommunityService adminCommunityService = new AdminCommunityServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// 관리자 로그인일 경우
		if (req.getSession().getAttribute("adminlogin") != null) {

			resp.setCharacterEncoding("UTF-8");

			BBoard bBoard = adminCommunityService.getIdx(req);

			BAttached bAttached = adminCommunityService.getFile(bBoard);

			// 게시글 상세보기
			BBoard list = adminCommunityService.view(bBoard);

			req.setAttribute("list", list);
			System.out.println(list);
			req.setAttribute("bAttached", bAttached);

			// 댓글 리스트 전달
			Bcomment comment = new Bcomment();
			List<Bcomment> commentList = adminCommunityService.getCommentList(list);
			req.setAttribute("commentList", commentList);

			// 추천 상태 전달
			Recommend recommend = new Recommend();
			recommend.setIdx(list.getIdx()); // 게시글 번호
			try {
				recommend.setUserno((int) req.getSession().getAttribute("Userno")); // 로그인한 아이디
			} catch (NullPointerException e) {
			}

			boolean isRecommend = adminCommunityService.isRecommend(recommend);
			req.setAttribute("isRecommend", isRecommend);

			int cnt = adminCommunityService.getTotalCntRecommend(recommend);

			req.setAttribute("reco", cnt);

			req.getRequestDispatcher("/WEB-INF/views/admin/admincommunityview.jsp").forward(req, resp);

		} else {

			// 관리자 로그인 안됐을 경우
			resp.sendRedirect("/admin/login");

		}
	}

}
