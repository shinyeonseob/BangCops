package web.dao.face;

import web.dto.Admin;

public interface AdminMemberDao {

	int selectCntMemberByUserid(Admin admin);

	Admin selectAdminByid(Admin admin);

}
