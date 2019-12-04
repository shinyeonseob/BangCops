package web.service.face;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import util.Paging;
import web.dto.BAccuse;
import web.dto.BAccuse2;

public interface AdminAaccuseService {

	List<BAccuse2> getListBAccuse(Paging paging);

	void aaccuseListDelete(String accuseno);

	BAccuse2 getbAccuse2(HttpServletRequest req);

	void delete(BAccuse baccuse);

}
