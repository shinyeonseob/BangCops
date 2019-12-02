package web.service.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import util.Paging;
import web.dao.face.AdminBoardDao;
import web.dao.impl.AdminBoardDaoImpl;
import web.dto.BBoard;
import web.service.face.AdminBoardService;

public class AdminBoardServiceImpl implements AdminBoardService {

	public AdminBoardDao adminBoardDao = new AdminBoardDaoImpl();
	
	@Override
	public List<BBoard> getList(Paging paging, HttpServletRequest req) {
		return adminBoardDao.selecAll(paging, req);
	}

	@Override
	public Paging getPaging(HttpServletRequest req) {
		// TOD//요청파라미터 curPage를 파싱한다
		String param = req.getParameter("curPage");
		int curPage =0;
		if( param!=null && !"".equals(param)) {
			curPage =Integer.parseInt(param);
		}

		//Board TB와 curPage 값을 이용해 Paging 객체를 생성하고 반환
		int totalcount = adminBoardDao.selectCntAll(req);

		//Paging 객체 생성
		Paging paging = new Paging(totalcount, curPage);

		if(req.getParameter("search")!=null&&!"".equals(req.getParameter("search"))) {
			paging.setSearch(req.getParameter("search"));
		}

		return paging;
	}

	@Override
	public BBoard getBoardno(HttpServletRequest req) {
		return adminBoardDao.selecBoardByBoardno(req);
	}

	@Override
	public void deleteAdminBoard(HttpServletRequest req) {
		adminBoardDao.deleteBoard(req);
	}

}
