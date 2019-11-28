package web.service.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import util.Paging;
import web.dao.face.AdminDao;
import web.dao.impl.AdminDaoImpl;
import web.service.face.AdminService;

public class AdminServiceImpl implements AdminService {

	AdminDao adminDao = new AdminDaoImpl();
	
	@Override
	public List getmemberList() {
		
		return adminDao.selectAll();
	}

	@Override
	public List getmemberList(Paging paging) {
		
		return adminDao.selectAll(paging);
	}

	@Override
	public Paging getPaging(HttpServletRequest req) {
		
		//요청파라미터 curPage를 파싱한다
				String param = req.getParameter("curPage");
				int curPage = 0;
				if( param!=null && !"".equals(param) ) {
					curPage = Integer.parseInt(param);
				}
//				System.out.println("curPage : " + curPage);
				
				
				//Board TB와 curPage 값을 이용한 Paging 객체를 생성하고 반환
				int totalCount = adminDao.selectCntAll();
				
				// Paging 객체 생성 
				Paging paging = new Paging(totalCount, curPage);
				
				return paging;
		
	}

	@Override
	public void delete(HttpServletRequest req) {
		
		
	}

	@Override
	public void memberListDelete(String names) {

		adminDao.deleteMemberList(names);
	}

	
}
