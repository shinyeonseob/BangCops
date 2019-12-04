package web.service.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import util.Paging;
import web.dao.face.AdminAaccuseDao;
import web.dao.impl.AdminAaccuseDaoImpl;
import web.dto.BAccuse;
import web.dto.BAccuse2;
import web.service.face.AdminAaccuseService;

public class AdminAaccuseServiceImpl implements AdminAaccuseService {

	AdminAaccuseDao adminAaccuseDao = new AdminAaccuseDaoImpl();
	
	@Override
	public List<BAccuse2> getListBAccuse(Paging paging) {
		// TODO Auto-generated method stub
		return adminAaccuseDao.getListBAccuse(paging);
	}

	@Override
	public void aaccuseListDelete(String accuseno) {
		
		int idx = adminAaccuseDao.selectidxtoaccuseno(accuseno);
		
		adminAaccuseDao.deleteBAccuse(accuseno);
		adminAaccuseDao.deleteBBoard(idx);
		adminAaccuseDao.deleteBDeal(accuseno);
		adminAaccuseDao.deleteBAttached(idx);
	}

	@Override
	public BAccuse2 getbAccuse2(HttpServletRequest req) {
		return adminAaccuseDao.getBAccuse2(req);

	}

	@Override
	public void delete(BAccuse baccuse) {
		String accuseno = Integer.toString(baccuse.getAccuseno());
		int idx = adminAaccuseDao.selectidxtoaccuseno(accuseno);
		
		adminAaccuseDao.deleteBAccuse(accuseno);
		adminAaccuseDao.deleteBBoard(idx);
		adminAaccuseDao.deleteBDeal(accuseno);
		adminAaccuseDao.deleteBAttached(idx);
		
	}

}
