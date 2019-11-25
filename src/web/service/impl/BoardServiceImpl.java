package web.service.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import util.Paging;
import web.dao.face.BoardDao;
import web.dao.impl.BoardDaoImpl;
import web.dto.BBoard;
import web.service.face.BoardService;

public class BoardServiceImpl implements BoardService {

	public BoardDao boardDao = new BoardDaoImpl();

	@Override
	public List<BBoard> getList() {
		return null;
	}

	@Override
	public List<BBoard> getList(Paging paging) {
		return boardDao.selectAll(paging);
	}

	@Override
	public Paging getPaging(HttpServletRequest req) {
		// 요청파라미터 curPage를 파싱한다.
		String param = req.getParameter("curPage");
		int curPage = 0;
		if (param != null && !"".equals(param)) {
			curPage = Integer.parseInt(param);
		}
//				System.out.println("curPage : " + curPage);

		// Board TB와 curPage 값을 이용한 Paging 객체를 생성하고 반환
		int totalCount = boardDao.selectCntAll();

		// paging 객체 생성
		Paging paging = new Paging(totalCount, curPage);

		return paging;
	}

}
