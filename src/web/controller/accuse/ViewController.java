package web.controller.accuse;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.dto.BAccuse;
import web.dto.BAttached;
import web.dto.BBoard;
import web.dto.BDeal;
import web.dto.Bcomment;
import web.dto.Recommend;
import web.service.face.AccuseService;
import web.service.face.BoardService;
import web.service.impl.AccuseServiceImpl;
import web.service.impl.BoardServiceImpl;

@WebServlet("/aview")
public class ViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// BoardService 객체
	private AccuseService accuseService = new AccuseServiceImpl();
	BoardService boardService = new BoardServiceImpl();


	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");

		int boardno = 6;

		
		// 게시글 번호 파싱
		BAccuse accuse = accuseService.getBAccuse(req);

		// 게시글 조회
		accuse = accuseService.view(accuse);
		
		BDeal bDeal = accuseService.getBdeal(accuse);
		
		BBoard bBoard = new BBoard();
		bBoard.setIdx(accuse.getIdx());
		
		BAttached bAttached = boardService.getFile(bBoard);

//		HttpSession session = req.getSession();
		// 게시글 상세보기
		BBoard list = boardService.view(bBoard);
//		System.out.println("[TEST] freeBoardviewco_bBoard : " + bBoard); //테스트 완료

//		System.out.println("[TEST] FBViewCon : " + list); //확인완료
//		System.out.println(bAttached); //확인 완료
		req.setAttribute("list", list);
		System.out.println(list);
		req.setAttribute("bAttached", bAttached);

//		System.out.println(session.getAttribute("Userno"));

		// 댓글 리스트 전달
		Bcomment comment = new Bcomment();
		List<Bcomment> commentList = boardService.getCommentList(list);
		req.setAttribute("commentList", commentList);

		// 추천 상태 전달
		Recommend recommend = new Recommend();
		recommend.setIdx(list.getIdx()); // 게시글 번호
		try {
		recommend.setUserno((int) req.getSession().getAttribute("Userno")); // 로그인한 아이디
		} catch(NullPointerException e) {
			System.out.println("로그인하지 않았음");
		}

		boolean isRecommend = boardService.isRecommend(recommend);
		req.setAttribute("isRecommend", isRecommend);
		
		int cnt = boardService.getTotalCntRecommend(recommend);
		
		req.setAttribute("reco", cnt);

		// MODEL로 게시글 전달
		req.setAttribute("viewABoard", accuse);
		
		req.setAttribute("bDeal", bDeal);

		// VIEW 지정
		req.getRequestDispatcher("/WEB-INF/view/accuse/accuserview.jsp").forward(req, resp);

	}

}
