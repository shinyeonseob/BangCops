package web.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import sun.dc.pr.PRError;
import util.Paging;
import web.dao.face.AdminDao;
import web.dbutil.DBconn;
import web.dto.BUser;

public class AdminDaoImpl implements AdminDao {

	private Connection conn = null; // DB 연결 객체
	private PreparedStatement ps = null; // SQL 수행 객체
	private ResultSet rs = null; // SQL 수행 결과 객체
	
	@Override
	public List selectAll() {
		
		conn = DBconn.getConnection(); //DB 연결
		
		//수행할 SQL
		String sql = "";
		sql += "SELECT ";
		sql += "	userno";
		sql += "	, userid";
		sql += "	, usernick";
		sql += "	, username";
		sql += "	, usertel";
		sql += " FROM buser";
		sql += " ORDER BY userno DESC";
		
		//최종 결과를 저장할 List
		List list = new ArrayList();
		
		try {
			//SQL 수행 객체
			ps = conn.prepareStatement(sql);
			
			//SQL 수행 및 결과 저장
			rs = ps.executeQuery();
			
			//SQL 수행 결과 처리
			while( rs.next() ) {
				
				BUser buser = new BUser();
				
				buser.setUserno( rs.getInt("userno"));
				buser.setUserid(rs.getString("userid"));
				buser.setUsernick(rs.getString("usernick"));
				buser.setUsername(rs.getString("username"));
				buser.setUsertel(rs.getString("usertel"));
				
				list.add(buser);
				System.out.println(buser);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null)	rs.close();
				if(ps!=null)	ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		//최종 결과 반환
		return list;
	}

	@Override
	public List selectAll(Paging paging) {
		
		conn = DBconn.getConnection(); //DB 연결
		
		//수행할 SQL
		String sql = "";
		sql += "SELECT * FROM (";
		sql += "    SELECT rownum rnum, M.* FROM (";
		sql += "        SELECT";
		sql += "            userno, userid, usernick,"; 
		sql += "            username, usertel";
		sql += "        FROM buser";
		sql += "		WHERE userid LIKE '%'||?||'%'";
		sql += "        ORDER BY userno DESC";
		sql += "    ) M";
		sql += "    ORDER BY rnum";
		sql += " ) Member";
		sql += " WHERE rnum BETWEEN ? AND ?";
		
		
		//최종 결과를 저장할 List
		List list = new ArrayList();
		
		try {
			//SQL 수행 객체
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, paging.getSearch());
			ps.setInt(2, paging.getStartNo());
			ps.setInt(3, paging.getEndNo());
			
			//SQL 수행 및 결과 저장
			rs = ps.executeQuery();
			
			//SQL 수행 결과 처리
			while( rs.next() ) {
				BUser buser = new BUser();
				
				buser.setUserno( rs.getInt("userno"));
				buser.setUserid(rs.getString("userid"));
				buser.setUsernick(rs.getString("usernick"));
				buser.setUsername(rs.getString("username"));
				buser.setUsertel(rs.getString("usertel"));
				list.add(buser);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null)	rs.close();
				if(ps!=null)	ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		//최종 결과 반환
		return list;
		
	}

	@Override
	public int selectCntAll() {
		
		conn = DBconn.getConnection(); //DB 연결
		
		//수행할 SQL
		String sql = "";
		sql += "SELECT ";
		sql += "	count(*)";
		sql += " FROM buser";

		//최종 결과 변수
		int cnt = 0;
		
		try {
			//SQL 수행 객체
			ps = conn.prepareStatement(sql);
			
			//SQL 수행 및 결과 저장
			rs = ps.executeQuery();
			
			//SQL 수행 결과 처리
			while( rs.next() ) {
				cnt = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null)	rs.close();
				if(ps!=null)	ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		//최종 결과 반환
		return cnt;
	}

	@Override
	public BUser selectMemberByUserno(BUser viewmember) {
		
		conn = DBconn.getConnection();
		
		// 게시글 조회쿼리
		String sql = "";
		sql += "SELECT ";
		sql += "	userno";
		sql += "	, userid";
		sql += "	, userpw";
		sql += "	, usernick";
		sql += "	, username";
		sql += "	, usertel";
		sql += " FROM buser";
		sql += " WHERE userno = ?";

		try {

			ps = conn.prepareStatement(sql);
			
			ps.setInt(1, viewmember.getUserno());

			rs = ps.executeQuery();

			while (rs.next()) {

				viewmember.setUserno(rs.getInt("userno"));
				viewmember.setUserid(rs.getString("userid"));
				viewmember.setUserpw(rs.getString("userpw"));
				viewmember.setUsernick(rs.getString("usernick"));
				viewmember.setUsername(rs.getString("username"));
				viewmember.setUsertel(rs.getString("usertel"));
				System.out.println(viewmember);
				
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				// 자원 해제
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return viewmember;

	}

	@Override
	public void updateUser(BUser buser) {
		
		conn = DBconn.getConnection();
		
		// 게시글 조회쿼리
		String sql = "";	
		sql += "UPDATE buser SET";
		sql += "	userid=?";
		sql += "	, usernick=?";
		sql += "	, username=?";
		sql += "	, usertel=?";
		sql += "	WHERE userno=?";
		
		try {
			
			ps = conn.prepareStatement(sql);
			ps.setString(1, buser.getUserid());
			ps.setString(2, buser.getUsernick());
			ps.setString(3, buser.getUsername());
			ps.setString(4, buser.getUsertel());
			
			ps.setInt(5, buser.getUserno());
			
			ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(ps!=null) ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
	}

	@Override
	public void delete(BUser buser) {

		conn = DBconn.getConnection();
		
		//다음 게시글 번호 조회 쿼리
		String sql = "";
		sql += "update buser set userid='탈퇴회원', userpw='', usernick='탈퇴회원', username='', usertel=''";
		sql += " WHERE userno = ?";

		// DB 객체
		PreparedStatement ps = null;

		try {
			// DB작업
			ps = conn.prepareStatement(sql);
			ps.setInt(1, buser.getUserno());

			ps.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();

		} finally {
			try {
				// DB객체 닫기
				if (ps != null)
					ps.close();

			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
	}

	@Override
	public void deleteMemberList(String names) {
		
		conn = DBconn.getConnection();
		
		String sql = "update buser set userid='탈퇴회원', userpw='', usernick='', username='', usertel='' where userno=?";

		PreparedStatement ps =null;
		try {
			ps = conn.prepareStatement(sql);

			ps.setInt(1, Integer.parseInt(names));
			
//			ps.executeQuery();
			ps.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (ps != null)
					ps.close();

			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
	}

	@Override
	public int selectCntAll(String search) {
		
		conn = DBconn.getConnection();
		
		// 수행할 SQL
		String sql = "";
		sql += "SELECT ";
		sql += "	count(*)";
		sql += " FROM buser";
		sql += " WHERE userid LIKE '%'||?||'%'";

		// 최종 결과 변수
		int cnt = 0;

		try {
			// SQL 수행 객체
			ps = conn.prepareStatement(sql);

			ps.setString(1, search);

			// SQL 수행 및 결과 저장
			rs = ps.executeQuery();

			// SQL 수행 결과 처리
			while (rs.next()) {
				cnt = rs.getInt(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		// 최종 결과 반환
		return cnt;
	}
	
}
