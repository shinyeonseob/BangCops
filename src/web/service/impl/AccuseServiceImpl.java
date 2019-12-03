package web.service.impl;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
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
import web.dao.face.AccuseDao;
import web.dao.face.BoardDao;
import web.dao.face.BoardFileDao;
import web.dao.impl.AccuseDaoImpl;
import web.dao.impl.BoardDaoImpl;
import web.dao.impl.BoardFileDaoImpl;
import web.dto.AccuseMap;
import web.dto.BAccuse;
import web.dto.BAttached;
import web.dto.BBoard;
import web.dto.BDeal;
import web.service.face.AccuseService;

public class AccuseServiceImpl implements AccuseService {

	private BoardDao boardDao = new BoardDaoImpl();
	private BoardFileDao boardFileDao = new BoardFileDaoImpl();
	private AccuseDao accuseDao = new AccuseDaoImpl();
//	private RecommendDao recommendDao = new RecommendDaoImpl();
//	private CommentDao commentDao = new CommentDaoImpl();

	@Override
	public BAccuse getBAccuse(HttpServletRequest req) {
		// 요청파라미터 boardno를 파싱한다
		String param = req.getParameter("idx");
		int idx = 0;
		if (param != null && !"".equals(param)) {
			idx = Integer.parseInt(param);
		}

		// 게시글 번호를 DTO에 넣기
		BAccuse baccuse = new BAccuse();
		baccuse.setIdx(idx);

//		
		return baccuse;
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
		BDeal BDeal = new BDeal();
		BAttached bAttached = null;
		BAccuse baccuse = new BAccuse();

		while (iter.hasNext()) {
			FileItem item = iter.next();

			// 1)빈 파일 처리
			if (item.getSize() <= 0)
				continue;

			// 2) 일반적인 요청 데이터 처리
			if (item.isFormField()) {

				// key값에 따라 처리방식 다르게 하기
				String key = item.getFieldName();

				// Board board = new Board();

				if ("title".equals(key)) {
					try {
						board.setTitle(item.getString("UTF-8"));
						System.out.println(key);
						System.out.println(item.getString("UTF-8"));
					} catch (UnsupportedEncodingException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}

				} else if ("contents".equals(key)) {

					try {
						board.setContents(item.getString("UTF-8"));
						System.out.println(key);
						System.out.println(item.getString("UTF-8"));
					} catch (UnsupportedEncodingException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}

				} else if ("boardno".equals(key)) {
					try {
						board.setBoardNo(Integer.parseInt(item.getString("UTF-8")));
						System.out.println(key);
						System.out.println(item.getString("UTF-8"));
					} catch (NumberFormatException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (UnsupportedEncodingException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				} else if ("URL".equals(key)) {

					try {
						baccuse.setUrl(item.getString("UTF-8"));
						System.out.println(key);
						System.out.println(item.getString("UTF-8"));
					} catch (UnsupportedEncodingException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}

				} else if ("City".equals(key)) {

					try {
						baccuse.setCity(item.getString("UTF-8"));
						System.out.println(key);
						System.out.println(item.getString("UTF-8"));
					} catch (UnsupportedEncodingException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}

				} else if ("Gu".equals(key)) {

					try {
						baccuse.setGu(item.getString("UTF-8"));
						System.out.println(key);
						System.out.println(item.getString("UTF-8"));
					} catch (UnsupportedEncodingException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}

				} else if ("sitename".equals(key)) {

					try {
						baccuse.setSitename(item.getString("UTF-8"));
						System.out.println(key);
						System.out.println(item.getString("UTF-8"));
					} catch (UnsupportedEncodingException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}

				} else if ("accuseType".equals(key)) {

					try {
						baccuse.setAccusetype(item.getString("UTF-8"));
						System.out.println(key);
						System.out.println(item.getString("UTF-8"));
					} catch (UnsupportedEncodingException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}

				} else if ("Agent".equals(key)) {

					try {
						baccuse.setAgent(item.getString("UTF-8"));
						System.out.println(key);
						System.out.println(item.getString("UTF-8"));
					} catch (UnsupportedEncodingException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}

				} else if ("Property".equals(key)) {

					try {
						baccuse.setProperty(item.getString("UTF-8"));
						System.out.println(key);
						System.out.println(item.getString("UTF-8"));
					} catch (UnsupportedEncodingException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}

				}else if ("PhoneNo".equals(key)) {
					try {
						baccuse.setPhoneNo(item.getString("UTF-8"));
						System.out.println(key);
						System.out.println(item.getString("UTF-8"));
					
					} catch (UnsupportedEncodingException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				} else if ("DealType2".equals(key)) {

					try {
						BDeal.setDealtype2(item.getString("UTF-8"));
						System.out.println(key);
						System.out.println(item.getString("UTF-8"));
					} catch (UnsupportedEncodingException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}

				}else if ("Deposit".equals(key)) {

					try {
						BDeal.setDeposit(Integer.parseInt(item.getString("UTF-8")));
						System.out.println(key);
						System.out.println(item.getString("UTF-8"));
					} catch (UnsupportedEncodingException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}

				}else if ("Price".equals(key)) {

					try {
						BDeal.setPrice(Integer.parseInt(item.getString("UTF-8")));
						System.out.println(key);
						System.out.println(item.getString("UTF-8"));
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
				// bAttached.setIdx(boardDao.selectIdx());
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
		board.setUserNo((int) session.getAttribute("Userno"));
		board.setIdx(idx);
		board.setTitle(Integer.toString(idx));

		boardDao.insert(board);

		if (bAttached != null && bAttached.getFilesize() != 0) {
			bAttached.setIdx(idx);
			boardFileDao.insertFile(bAttached);
			// System.out.println(bAttached);
		}
		baccuse.setIdx(idx);
		int accuseno = accuseDao.selectAccuseNo();
		baccuse.setAccuseno(accuseno);
		BDeal.setAccuseno(accuseno);
		accuseDao.insert(baccuse);
		accuseDao.insertBDeal(BDeal);

	}

	@Override
	public void delete(BAccuse baccuse) {

//		accuseDao.deleteFile(baccuse);
//		
//		accuseDao.delete(baccuse);

	}

	@Override
	public BAccuse view(BAccuse viewABoard) {

		// 게시글 조회수 +1
		accuseDao.updateHit(viewABoard);

		// 게시글 조회 반환
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

	@Override
	public List<BAccuse> getSearchListBAccuse(Paging paging, HttpServletRequest req) {
		
		return accuseDao.getSearchListBAccuse(paging, req);
	}

	@Override
	public List<BBoard> getSearchList(Paging paging, int boardno) {
		return accuseDao.selectSearchAll(paging, boardno);
	}

	@Override
	public List getLocation() {
		List list = new ArrayList();
		
		String guname[] = {"강남", "강동", "강서", "강북"
						, "관악","광진","구로","금천"
						, "노원","동대문","도봉","동작"
						, "마포","서대문","성동","성북"
						, "서초","송파","영등포","용산"
						, "양천","은평","종로","중","중랑"};
		
		
		
		for(int i = 0; i<guname.length;i++) {
			AccuseMap accusemap = new AccuseMap(); 
			
			accusemap.setGuname(guname[i]);
			accusemap.setLat(accuseDao.getLocation(guname[i]).getLat());
			accusemap.setLng(accuseDao.getLocation(guname[i]).getLng());
			accusemap.setTotalaccuse(accuseDao.getTotalaccuse(guname[i]));
			accusemap.setTotalagent(accuseDao.getTotalagent(guname[i]));
			list.add(accusemap);
		}
		
		
		return list;
	}

}






































