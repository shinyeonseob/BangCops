package web.dao.face;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import util.Paging;
import web.dto.BAccuse;
import web.dto.BAccuse2;

public interface AdminAaccuseDao {

	List<BAccuse2> getListBAccuse(Paging paging);

	void deleteBAccuse(String accuseno);

	void deleteBBoard(int idx);

	int selectidxtoaccuseno(String accuseno);

	void deleteBDeal(String accuseno);

	void deleteBAttached(int idx);

	BAccuse2 getBAccuse2(HttpServletRequest req);

}
