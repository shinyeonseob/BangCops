package web.service.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import util.Paging;
import web.dao.face.AdminDao;
import web.dao.impl.AdminDaoImpl;
import web.dto.BUser;
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
		if (param != null && !"".equals(param)) {
			curPage = Integer.parseInt(param);
		}
//				System.out.println("curPage : " + curPage);

		String search = req.getParameter("search");

		// Board TB와 curPage 값을 이용한 Paging 객체를 생성하고 반환
		int totalCount = adminDao.selectCntAll(search);

		// Paging 객체 생성
		Paging paging = new Paging(totalCount, curPage);

		paging.setSearch(search);
		
		return paging;
		
	}

	@Override
	public BUser getUserno(HttpServletRequest req) {
		
		String param = req.getParameter("userno");
//		System.out.println(req.getParameter("userno"));
		int userno = 0;
		if( param!=null && !"".equals(param) ) {
			userno = Integer.parseInt(param);
		}
				
		//게시글 번호를 DTO에 넣기
		BUser buser = new BUser();
		buser.setUserno(userno);
		
		return adminDao.selectMemberByUserno(buser);
		
	}

	@Override
	public boolean checkId(HttpServletRequest req) {
		
		// 로그인한 세션 ID얻기
		String loginId = (String)req.getSession().getAttribute("userid");
		
		// 회원번호 얻기
		BUser buser = getUserno(req);
		
		// 회원번호 얻기
		buser = adminDao.selectMemberByUserno(buser);
		
		// 로그인 아이디 비교
		if(!loginId.equals(buser.getUserid())) {
			return false;
		}
		return true;
	}

	@Override
	public BUser view(BUser viewBuser) {
		return adminDao.selectMemberByUserno(viewBuser);
	}

	@Override
	public void update(HttpServletRequest req) {
		
		BUser buser = new BUser();
		
		buser.setUserno(Integer.parseInt(req.getParameter("userno")));
		buser.setUserid(req.getParameter("userid"));
		buser.setUsernick(req.getParameter("usernick"));
		buser.setUsername(req.getParameter("username"));
		buser.setUsertel(req.getParameter("usertel"));
		
		System.out.println(buser);
		
		adminDao.updateUser(buser);
	}

	@Override
	public void delete(BUser buser) {
		
		adminDao.delete(buser);
		
	}

	// 체크리스트로 삭제
	@Override
	public void memberListDelete(String names) {
		
		adminDao.deleteMemberList(names);
	}
	
}
