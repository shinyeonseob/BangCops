package web.service.face;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import web.dto.BUser;

public interface MemberService {

	BUser getLoginMember(HttpServletRequest req);

	boolean login(BUser getLoginMember);

	BUser getMemberByUserid(BUser getLoginMember);

	void join(BUser bUser);
	void join(HttpServletRequest req);
	
	public void update(BUser member); 
	
	/**
	 * 회원정보 수정
	 * 
	 * @param req - 요청 정보 객체
	 */

	void update(HttpServletRequest req);

	
	BUser getcurrpw(HttpServletRequest req);

	BUser getUpdatepw(HttpServletRequest req);

	void updatepw(BUser param);

	BUser getupdateUser(HttpServletRequest req);

	






}
