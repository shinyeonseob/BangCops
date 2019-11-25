package web.service.face;

import javax.servlet.http.HttpServletRequest;

import web.dto.Admin;

public interface AdminMemberService {

	Admin getLoginAdmin(HttpServletRequest req);

	boolean login(Admin admin);

	Admin getAdminByid(Admin admin);

}
