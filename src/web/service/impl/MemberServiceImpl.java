package web.service.impl;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import web.dao.face.MemberDao;
import web.dao.impl.MemberDaoImpl;
import web.dto.BUser;

import web.service.face.MemberService;


public class MemberServiceImpl implements MemberService {

	MemberDao memberDao = new MemberDaoImpl();
	@Override
	public BUser getLoginMember(HttpServletRequest req) {

		String userid = new String();
		String userpw = new String();
		
		userid = req.getParameter("UserID");
		userpw = req.getParameter("UserPW");
		
		BUser member = new BUser();
		member.setUserid(userid);
		member.setUserpw(userpw);
				
		
		return member;
	}

	@Override
	public boolean login(BUser getLoginMember) {
		int i = memberDao.selectCntMemberByUserid(getLoginMember);
		if (i == 0) {
			return false;
		}		
		return true;
	}

	@Override
	public BUser getMemberByUserid(BUser getLoginMember) {
		return memberDao.selectMemberByUserid(getLoginMember);

	}

	@Override
	public void join(HttpServletRequest req) {
		
		try {
			req.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String userid = req.getParameter("UserID");
		String userpw = req.getParameter("UserPW");
		String usernick = req.getParameter("UserNick");
		String username = req.getParameter("UserName");
		String usertel = req.getParameter("UserTel");
		
		BUser member = new BUser();
		member.setUserid(userid);
		member.setUserpw(userpw);
		member.setUsernick(usernick);
		member.setUsername(username);
		member.setUsertel(usertel);
		
		
		memberDao.insert(member);
		
	}


	

}
