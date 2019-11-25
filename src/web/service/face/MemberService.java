package web.service.face;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import web.dto.BUser;

public interface MemberService {

	BUser getLoginMember(HttpServletRequest req);

	boolean login(BUser getLoginMember);

	BUser getMemberByUserid(BUser getLoginMember);

	void join(BUser member);
	
	
	

}
