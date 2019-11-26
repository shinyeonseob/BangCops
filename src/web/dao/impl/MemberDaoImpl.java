package web.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import web.dao.face.MemberDao;
import web.dbutil.DBconn;
import web.dto.BUser;

public class MemberDaoImpl implements MemberDao {

	private Connection conn = null; // DB 연결 객체
	private PreparedStatement ps = null; // SQL 수행 객체
	private ResultSet rs = null; // SQL 수행 결과 객체

	@Override
	public int selectCntMemberByUserid(BUser getLoginMember) {
		conn = DBconn.getConnection(); // DB 연결

		String sql = "SELECT count(*) FROM BUser where UserID = ? and UserPW = ?";

		int a = -1;

		try {
			ps = conn.prepareStatement(sql); // 수행객체 얻기
			ps.setString(1, getLoginMember.getUserid()); // sql 'empno = ?'의 ? 채우기
			ps.setString(2, getLoginMember.getUserpw()); // sql 'empno = ?'의 ? 채우기

			rs = ps.executeQuery(); // SQL 수행결과 얻기

			rs.next();

			a = rs.getInt(1);

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

		return a;
	}

	@Override
	public BUser selectMemberByUserid(BUser getLoginMember) {
		conn = DBconn.getConnection(); // DB 연결

		// 수행할 SQL 쿼리
		String sql = "SELECT * FROM BUser WHERE userid = ? ";

		BUser member = new BUser();
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, getLoginMember.getUserid()); // sql 'empno = ?'의 ? 채우기
			rs = ps.executeQuery(); // SQL 수행결과 얻기

			while (rs.next()) {

				member.setUserno(rs.getInt("userno"));
				member.setUserid(rs.getString("userid"));
				member.setUserpw(rs.getString("userpw"));
				member.setUsernick(rs.getString("usernick"));
				member.setUsername(rs.getString("username"));
				member.setUsertel(rs.getString("usertel"));
				member.setUserlevel(rs.getInt("userlevel"));

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return member;
	}

	@Override
	public void insert(BUser member) {
		conn = DBconn.getConnection(); // DB 연결

		String sql = "INSERT INTO BUser(UserNo, UserID, UserPW, UserNick, UserName, UserTel) VALUES (BUser_seq.nextval, ? , ? , ?, ?, ?)";

		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, member.getUserid()); // sql 'empno = ?'의 ? 채우기
			
			ps.setString(2, member.getUserpw()); // sql 'empno = ?'의 ? 채우기
			ps.setString(3, member.getUsernick()); // sql 'empno = ?'의 ? 채우기
			ps.setString(4, member.getUsername()); // sql 'empno = ?'의 ? 채우기
			ps.setString(5, member.getUsertel()); // sql 'empno = ?'의 ? 채우기

			rs = ps.executeQuery(); // SQL 수행결과 얻기

		} catch (SQLException e) {
			e.printStackTrace();
		}		
	}

	@Override
	public void update(BUser member) {
		conn = DBconn.getConnection(); // DB연결

		// 수행할 SQL 쿼리
		String sql = "";
		sql += "UPDATE BUser SET userid = ? , usernick = ? , usertel = ?";
		sql += " WHERE userno = ?";

		try {
			ps = conn.prepareStatement(sql);

			ps.setString(1,  member.getUserid());
			ps.setString(2,  member.getUsernick());
			ps.setString(3,  member.getUsertel());
			ps.setInt(4,  member.getUserno());



		} catch (SQLException e) {
			e.printStackTrace();
		}




	}

	@Override
	public void updatepw(BUser param) {
		conn = DBconn.getConnection(); // DB연결


		// 수행할 SQL 쿼리
		String sql = "";
		sql += "UPDATE BUser SET userpw = ? ";
		sql += " WHERE userno = ?";


		try {
			ps = conn.prepareStatement(sql);

			ps.setString(1,  param.getUserpw());
			ps.setInt(2,  param.getUserno());
//			ps.setString(2,  param.getUserid());
			
			ps.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	@Override
	public int cntUserid(BUser bUser) {
		conn = DBconn.getConnection(); // DB 연결

		String sql = "SELECT count(*) FROM BUser where UserID = ?";

		int a = -1;

		try {
			ps = conn.prepareStatement(sql); // 수행객체 얻기
			ps.setString(1, bUser.getUserid()); // sql 'empno = ?'의 ? 채우기

			rs = ps.executeQuery(); // SQL 수행결과 얻기

			rs.next();

			a = rs.getInt(1);

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

		return a;
	}

	@Override
	public boolean nickcheck(String usernick) {
		conn = DBconn.getConnection(); // DB 연결

		String sql = "SELECT count(*) FROM BUser where UserNick = ?";

		
		try {
			ps = conn.prepareStatement(sql); // 수행객체 얻기
			ps.setString(1, usernick); // sql 'empno = ?'의 ? 채우기

			rs = ps.executeQuery(); // SQL 수행결과 얻기

			rs.next();

			if (rs.getInt(1) == 0) {
				return false;
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

		return true;
	}
}


