package web.service.impl;

import javax.servlet.http.HttpServletRequest;

import web.dao.face.AdminMemberDao;
import web.dao.impl.AdminMemberDaoImpl;
import web.dto.Admin;
import web.service.face.AdminMemberService;

public class AdminMemberServiceImpl implements AdminMemberService {
	
	AdminMemberDao adminMemberDao = new AdminMemberDaoImpl();

	@Override
	public Admin getLoginAdmin(HttpServletRequest req) {
		
		
		
		String adminid = new String();
		String adminpw = new String();
		
		adminid = req.getParameter("id");
		adminpw = req.getParameter("pw");
		
		Admin admin = new Admin();
		
		admin.setAdminid(adminid);
		admin.setAdminpw(adminpw);
				
		
		return admin;
	}

	@Override
	public boolean login(Admin admin) {
		int i = adminMemberDao.selectCntMemberByUserid(admin);
		if (i == 0) {
			return false;
		}		
		return true;
	}

	@Override
	public Admin getAdminByid(Admin admin) {
		
		return adminMemberDao.selectAdminByid(admin);
	}

}
