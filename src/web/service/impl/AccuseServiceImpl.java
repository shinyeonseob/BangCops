package web.service.impl;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.servlet.ServletFileUpload;

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
		String param = req.getParameter("accuseno");
		int boardno = 0;
		if( param!=null && !"".equals(param) ) {
			boardno = Integer.parseInt(param);
		}
		
		//게시글 번호를 DTO에 넣기
		BAccuse baccuse = new BAccuse();
//		baccuse.setBBoardno(boardno);
//		
		return baccuse;
	}

	@Override
	public void write(HttpServletRequest req) {
		BAccuse baccuse = null;
//		BoardFile boardFile = null;	
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

}
