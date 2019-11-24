package web.dao.face;

import web.dto.BUser;

public interface MemberDao {

	int selectCntMemberByUserid(BUser getLoginMember);

	BUser selectMemberByUserid(BUser getLoginMember);

	void insert(BUser member);

}
