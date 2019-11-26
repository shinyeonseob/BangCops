package web.dao.face;

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

	void updatepw(BUser param);

}
