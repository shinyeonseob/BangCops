package web.service.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.servlet.ServletFileUpload;

import util.Paging;
import web.dao.face.AccuseDao;
import web.dao.impl.AccuseDaoImpl;
import web.dto.BAccuse;
import web.service.face.AccuseService;

public class AccuseServiceImpl implements AccuseService {
	
	private AccuseDao accuseDao = new AccuseDaoImpl();
//	private RecommendDao recommendDao = new RecommendDaoImpl();
//	private CommentDao commentDao = new CommentDaoImpl();
	
	

	@Override
	public BAccuse getBAccuse(HttpServletRequest req) {
		//요청파라미터 boardno를 파싱한다
		String param = req.getParameter("idx");
		int idx = 0;
		if( param!=null && !"".equals(param) ) {
			idx = Integer.parseInt(param);
		}
		
		//게시글 번호를 DTO에 넣기
		BAccuse baccuse = new BAccuse();
		baccuse.setIdx("idx");
		
//		
		return baccuse;
	}

	@Override
	public void write(HttpServletRequest req) {
		BAccuse baccuse = null;
		BoardFile boardFile = null;	
		boolean isMultipart = ServletFileUpload.isMultipartContent(req);
		
		if(!isMultipart) { //multipart/form-data 형식인지 검사
			System.out.println("[ERROR] multipart/form-data 형식이 아님");
			return;
			
		}
	
	}



	@Override
	public void delete(BAccuse baccuse) {
		
//		accuseDao.deleteFile(baccuse);
//		
//		accuseDao.delete(baccuse);

	}

	@Override
	public BAccuse view(BAccuse viewABoard) {
	
	//게시글 조회수 +1
	accuseDao.updateHit(viewABoard);
		
	//게시글 조회 반환
	return accuseDao.selectBoardByBoardno(viewABoard);

	}

//	@Override
//	public Paging getPaging(HttpServletRequest req) {
//		//요청파라미터 curPage를 파싱한다
//		String param = req.getParameter("curPage");
//		int curPage = 0;
//		if( param!=null && !"".equals(param) ) {
//			curPage = Integer.parseInt(param);
//		}
////		System.out.println("curPage : " + curPage);
//		
//
//		
//		//검색어
//		String search = (String)req.getParameter("search");
//
//		
//		//Board TB와 curPage 값을 이용한 Paging 객체를 생성하고 반환
//		int totalCount = accuseDao.selectCntAll(search);
//		
//		// Paging 객체 생성 
//		Paging paging = new Paging(totalCount, curPage);
//		
//		//검색어
//		paging.setSearch(search);
//
//		return paging;
//	}
//	


	@Override
	public List getList(Paging paging) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Paging getPaging(HttpServletRequest req) {
		// TODO Auto-generated method stub
		return null;
	}

}
