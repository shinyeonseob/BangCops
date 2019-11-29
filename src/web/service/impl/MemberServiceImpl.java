package web.service.impl;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import util.Paging;
import web.dao.face.MemberDao;
import web.dao.impl.MemberDaoImpl;
import web.dto.BUser;
import web.service.face.MemberService;


public class MemberServiceImpl implements MemberService {

	MemberDao memberDao = new MemberDaoImpl();
	
	@Override
	public BUser getLoginMember(HttpServletRequest req) {

		String userid = new String();
		String userpw = new String();
		
		userid = req.getParameter("UserID");
		userpw = req.getParameter("UserPW");
		
		BUser member = new BUser();
		member.setUserid(userid);
		member.setUserpw(userpw);
				
		
		return member;
	}

	@Override
	public boolean login(BUser getLoginMember) {
		int i = memberDao.selectCntMemberByUserid(getLoginMember);
		if (i == 0) {
			return false;
		}		
		return true;
	}

	@Override
	public BUser getMemberByUserid(BUser getLoginMember) {
		return memberDao.selectMemberByUserid(getLoginMember);

	}


	@Override
	public void join(HttpServletRequest req) {
		
		try {
			req.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String userid = req.getParameter("UserID");
		String userpw = req.getParameter("UserPW");
		String usernick = req.getParameter("UserNick");
		String username = req.getParameter("UserName");
		String usertel = req.getParameter("UserTel");
		
		BUser member = new BUser();
		member.setUserid(userid);
		member.setUserpw(userpw);
		member.setUsernick(usernick);
		member.setUsername(username);
		member.setUsertel(usertel);
		
		
		memberDao.insert(member);
		
	}

	
	

	@Override

	public void update(HttpServletRequest req) {
		BUser member = null;
		
		boolean isMultipart = ServletFileUpload.isMultipartContent(req);
		
		if(!isMultipart) {
			//파일 첨부가 없을 경우
			member = new BUser();
			
			member.setUserid((String) req.getSession().getAttribute("userid"));


			
		} else {
			//파일업로드를 사용하고 있을 경우
			member = new BUser();

			//디스크팩토리
			DiskFileItemFactory factory = new DiskFileItemFactory();

			//메모리처리 사이즈
			factory.setSizeThreshold(1 * 1024 * 1024); //1MB

			//임시 저장소
			File repository=new File(req.getServletContext().getRealPath("tmp"));
			factory.setRepository(repository);
			
			//업로드 객체 생성
			ServletFileUpload upload = new ServletFileUpload(factory);
			
			//용량 제한 설정 : 10MB
			upload.setFileSizeMax(10 * 1024 * 1024);
			
			//form-data 추출 
			List<FileItem> items = null;
			try {
				items = upload.parseRequest(req);
				
			} catch (FileUploadException e) {
				e.printStackTrace();
			}
			
			//파싱된 데이터 처리 반복자
			Iterator<FileItem> iter = items.iterator();
			
			//요청정보 처리
			while( iter.hasNext() ) {
				FileItem item = iter.next();
				
				// 빈 파일 처리
				if( item.getSize() <= 0 )	continue;
				
				// 빈 파일이 아닐 경우
				if( item.isFormField() ) {
					try {
						if( "userno".equals( item.getFieldName() ) ) {
							member.setUserno( Integer.parseInt(item.getString()) );
						}
	
						if( "userid".equals( item.getFieldName() ) ) {
							member.setUserid( item.getString("utf-8") ); 
						}
						if( "usernick".equals( item.getFieldName() ) ) {
							member.setUsernick( item.getString("utf-8") );
						}
						if( "usertel".equals( item.getFieldName() ) ) {
							member.setUsertel( item.getString("utf-8") );
						}
					} catch (UnsupportedEncodingException e) {
						e.printStackTrace();
					}
					
				} else {
					UUID uuid = UUID.randomUUID();
					String u = uuid.toString().split("-")[4];

					//로컬 저장소 파일
					String stored = item.getName() + "_" + u;
					File up = new File(
						req.getServletContext().getRealPath("upload")
						, stored);
					
					
					member.setPhoto(item.getName());
					
					try {
						// 실제 업로드
						item.write(up);
						
						// 임시 파일 삭제
						item.delete();
						
					} catch (Exception e) {
						e.printStackTrace();
					} // try end
				} //if end
			} //while end
		} //if(!isMultipart) end

		if(member != null) {
			memberDao.update(member);
		}
	
	}



	@Override
	public BUser getcurrpw(HttpServletRequest req) {

		
		BUser buser = new BUser();
		buser.setUserpw(req.getParameter("userpw"));
				
		
		return buser;
	}

	@Override
	public BUser getUpdatepw(HttpServletRequest req) {
		BUser buser = new BUser();
		
		buser.setUserpw(req.getParameter("updatepw"));
		
		return buser;
	}

	@Override
	public void updatepw(BUser param) {
		memberDao.updatepw(param);
	}


	


	public BUser getbUser(HttpServletRequest req) {
		

		try {
			req.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String userid = req.getParameter("UserID");
		String userpw = req.getParameter("UserPW");
		String usernick = req.getParameter("UserNick");
		String username = req.getParameter("UserName");
		String usertel = req.getParameter("UserTel");
		
		BUser member = new BUser();
		member.setUserid(userid);
		member.setUserpw(userpw);
		member.setUsernick(usernick);
		member.setUsername(username);
		member.setUsertel(usertel);
		
		return member;
	}

	@Override
	public void join(BUser bUser) {

		memberDao.insert(bUser);
	}

	@Override
	public BUser getupdateUser(HttpServletRequest req) {
		try {
			req.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		BUser member = new BUser();
		member.setUsernick(req.getParameter("usernick"));
		member.setUsertel(req.getParameter("usertel"));
		return member;


	}

	@Override
	public int cntUserid(BUser bUser) {
		
		return memberDao.cntUserid(bUser);
	}

	@Override
	public boolean nickcheck(String usernick) {
		
		return memberDao.nickcheck(usernick);
	}

	@Override
	public void update(BUser member) {
		memberDao.update(member);
	}

	@Override
	public List getmemberList() {
		
		return memberDao.selectAll();
	}

	@Override
	public List getmemberList(Paging paging) {
		
		return memberDao.selectAll(paging);
	}

	@Override
	public Paging getPaging(HttpServletRequest req) {
		
		//요청파라미터 curPage를 파싱한다
				String param = req.getParameter("curPage");
				int curPage = 0;
				if( param!=null && !"".equals(param) ) {
					curPage = Integer.parseInt(param);
				}
//				System.out.println("curPage : " + curPage);
				
				
				//Board TB와 curPage 값을 이용한 Paging 객체를 생성하고 반환
				int totalCount = memberDao.selectCntAll();
				
				// Paging 객체 생성 
				Paging paging = new Paging(totalCount, curPage);
				
				return paging;
		
	}

	@Override
	public void DeleteUser(BUser buser) {
		memberDao.deleteUser(buser);
	}

	public int cntUserNick(BUser bUser) {
		return memberDao.cntUserNick(bUser);

	}

	@Override
	public BUser getPwtoID(HttpServletRequest req) {
		
		String userid = req.getParameter("UserID");
		
		BUser member = new BUser();
		member.setUserid(userid);
				
		
		return memberDao.selectMemberByUserid(member);
	}
		
}

