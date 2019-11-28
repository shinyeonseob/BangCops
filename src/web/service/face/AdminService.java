package web.service.face;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import util.Paging;

public interface AdminService {

	public List getmemberList();

	public List getmemberList(Paging paging);
	
	public Paging getPaging(HttpServletRequest req);

	public void delete(HttpServletRequest req);
	
	public void memberListDelete(String names);
	
}
