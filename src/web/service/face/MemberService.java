package web.service.face;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import util.Paging;
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

	BUser getbUser(HttpServletRequest req);

	int cntUserid(BUser bUser);

	boolean nickcheck(String usernick);

	
	BUser getcurrpw(HttpServletRequest req);

	BUser getUpdatepw(HttpServletRequest req);

	void updatepw(BUser param);

	BUser getupdateUser(HttpServletRequest req);



	public List getmemberList();

	public List getmemberList(Paging paging);
	
	public Paging getPaging(HttpServletRequest req);

	void DeleteUser(BUser buser);



	int cntUserNick(BUser bUser);

	
}
