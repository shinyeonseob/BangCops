package web.service.face;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import web.dto.BUser;

public interface MemberService {

	BUser getLoginMember(HttpServletRequest req);

	boolean login(BUser getLoginMember);

	BUser getMemberByUserid(BUser getLoginMember);

	void join(BUser bUser);
	
	
	/**
	 * 정보수정 (파일업로드 제외)
	 * 
	 * @param member BUser 정보수정 수행
	 */
	void update(BUser member);

	BUser getbUser(HttpServletRequest req);


}
