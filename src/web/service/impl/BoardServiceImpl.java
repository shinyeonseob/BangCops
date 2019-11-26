package web.service.impl;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import util.Paging;
import web.dao.face.BoardDao;
import web.dao.face.BoardFileDao;
import web.dao.impl.BoardDaoImpl;
import web.dao.impl.BoardFileDaoImpl;
import web.dto.BAttached;
import web.dto.BBoard;
import web.service.face.BoardService;

public class BoardServiceImpl implements BoardService {

	private BoardDao boardDao = new BoardDaoImpl();
	private BoardFileDao boardFileDao = new BoardFileDaoImpl();

	@Override
	public List<BBoard> getList() {
		return null;
	}

	@Override
	public List<BBoard> getList(Paging paging) {
		return boardDao.selectAll(paging);
	}

	@Override
	public Paging getPaging(HttpServletRequest req) {
		// 요청파라미터 curPage를 파싱한다.
		String param = req.getParameter("curPage");
		int curPage = 0;
		if (param != null && !"".equals(param)) {
			curPage = Integer.parseInt(param);
		}
//				System.out.println("curPage : " + curPage);

		// Board TB와 curPage 값을 이용한 Paging 객체를 생성하고 반환
		int totalCount = boardDao.selectCntAll();

		// paging 객체 생성
		Paging paging = new Paging(totalCount, curPage);

		return paging;
	}

	@Override
	public BBoard view(BBoard bBoard) {
		boardDao.updateHit(bBoard);
		return boardDao.selectBoardByBoardno(bBoard);
	}

	@Override
	public void write(BBoard board) {
		boardDao.insert(board);
		
	}

	@Override
	public void write(HttpServletRequest req) {
		// 파일 업로드 형태의 데이터가 맞는지 확인
				// = 멀티파트/폼데이터가 맞는지 확인
				boolean isMultipart = false;
				isMultipart = ServletFileUpload.isMultipartContent(req);

				if (!isMultipart) {
					System.out.println("멀티파트 아님");
					return;
				}

				// 업로드된 파일을 디스크에 임시 저장하고 후처리한다.
				DiskFileItemFactory factory = null;
				factory = new DiskFileItemFactory();

				// 파일 사이즈가 1메가 보다 작을경우 메모리에서 처리
				int maxMem = 1 * 1024 * 1024; // 1MB
				factory.setSizeThreshold(maxMem);

				// 용량이 1메가이상 10메가 이하일 경우 임시파일을 만들어서 처리
				ServletContext context = req.getServletContext();
				String path = context.getRealPath("tmp");
				
				File repository = new File(path);

				factory.setRepository(repository);

				// 업로드 허용 용량기준(10메가)를 넘지 않을 경우에만 업로드 하도록 처리
				int maxFile = 10 * 1024 * 1024; // 10MB

				// 업로드 객체 생성
				ServletFileUpload upload = null;
				upload = new ServletFileUpload(factory);

				// 파일 업로드 용량 제한 설정 : 10MB
				upload.setFileSizeMax(maxFile);

				// 여기까지 파일 업로드 준비 및 완료

				// 6. 업로드된 데이터 추출(파싱)
				// 임시 파일 업로드도 같이 수행함
				List<FileItem> items = null;
				try {
					items = upload.parseRequest(req);
				} catch (FileUploadException e) {
					e.printStackTrace();
				}

				Iterator<FileItem> iter = items.iterator();
				BBoard board = new BBoard();
				BAttached bAttached = null;

				while (iter.hasNext()) {
					FileItem item = iter.next();

					// 1)빈 파일 처리
					if (item.getSize() <= 0) continue;

					// 2) 일반적인 요청 데이터 처리
					if (item.isFormField()) {

						// key값에 따라 처리방식 다르게 하기
						String key = item.getFieldName();

//						Board board = new Board();

						if ("title".equals(key)) {
							try {
								board.setTitle(item.getString("UTF-8"));
							} catch (UnsupportedEncodingException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}

						} else if ("contents".equals(key)) {

							try {
								board.setContents(item.getString("UTF-8"));
							} catch (UnsupportedEncodingException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}

						} 

					} else { // 3) 파일처리
						bAttached = new BAttached();

						UUID uuid = UUID.randomUUID(); // 랜덤 UID 생성
						
						// 12자리 uid 얻기
						String u = uuid.toString().split("-")[4];
						// ---------------------------------

						// 로컬 파일 저장소에 파일 저장하기

						// 로컬 저장소 파일 객체
						File up = new File(context.getRealPath("upload"), item.getName() + "_" + u);

						bAttached.setOriginName(item.getName());
						bAttached.setStoredName(item.getName() + "_" + u);
						bAttached.setFilesize(item.getSize());
						bAttached.setFileRoot(path);
//						bAttached.setIdx(boardDao.selectIdx());
						try {
							item.write(up); // 실제 업로드
							item.delete(); // 임시 파일 삭제
						} catch (Exception e) { 
							e.printStackTrace();
						}

						// - - - - - - - - - - - - - - - -

					} // 파일처리 if
				} // 요청파라미터 처리 while

				int idx = boardDao.selectIdx();

				HttpSession session = req.getSession();

				board.setUsernick((String) session.getAttribute("UserNick"));
				board.setUserNo((int)session.getAttribute("Userno"));
				board.setIdx(idx);
				boardDao.insert(board);

				if(bAttached != null && bAttached.getFilesize() != 0) {
					bAttached.setIdx(idx);
					boardFileDao.insertFile(bAttached);
			
//					System.out.println(bAttached);
				}
	}

	@Override
	public BAttached getFile(BBoard bBoard) {
		return boardFileDao.selectFile(bBoard);
	}

	@Override
	public BBoard getIdx(HttpServletRequest req) {
		String param = req.getParameter("idx");
		
		int idx = 0;
		if(param != null && !"".equals(param)) {
			idx = Integer.parseInt(param);
		}
		BBoard bBoard = new BBoard();
		bBoard.setIdx(idx);
		return bBoard;
	}

	@Override
	public void delete(BBoard bBoard) {
		boardDao.delete(bBoard);
	}

}
