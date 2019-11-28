package web.dao.face;

import java.util.List;

import util.Paging;
import web.dto.BUser;

public interface MemberDao {

	int selectCntMemberByUserid(BUser getLoginMember);

	BUser selectMemberByUserid(BUser getLoginMember);

	void insert(BUser member);

	/**
	 * BUser update 쿼리
	 * 
	 * @param member user에 해당하는 정보 수정
	 */
	void update(BUser member);

	int cntUserid(BUser bUser);

	boolean nickcheck(String usernick);


	void updatepw(BUser param);

	int cntUserNick(BUser bUser);
	
}
