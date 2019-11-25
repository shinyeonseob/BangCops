package web.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import web.dao.face.AdminMemberDao;
import web.dbutil.DBconn;
import web.dto.Admin;
import web.dto.BUser;

public class AdminMemberDaoImpl implements AdminMemberDao {
	
	private Connection conn = null; // DB 연결 객체
	private PreparedStatement ps = null; // SQL 수행 객체
	private ResultSet rs = null; // SQL 수행 결과 객체

	@Override
	public int selectCntMemberByUserid(Admin admin) {
		conn = DBconn.getConnection(); // DB 연결

		String sql = "SELECT count(*) FROM BAdmin where AdminID = ? and AdminPW = ?";

		int a = -1;
		System.out.println(admin);

		try {
			ps = conn.prepareStatement(sql); // 수행객체 얻기
			ps.setString(1, admin.getAdminid()); 
			ps.setString(2, admin.getAdminpw()); 

			rs = ps.executeQuery(); // SQL 수행결과 얻기

			rs.next();

			a = rs.getInt(1);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return a;
	}

	@Override
	public Admin selectAdminByid(Admin admin) {
		conn = DBconn.getConnection(); // DB 연결

		// 수행할 SQL 쿼리
		String sql = "SELECT * FROM BAdmin WHERE AdminID = ? ";

		Admin admin2 = new Admin();
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, admin.getAdminid()); // sql 'empno = ?'의 ? 채우기
			rs = ps.executeQuery(); // SQL 수행결과 얻기

			while (rs.next()) {
				
				admin2.setAdminid(rs.getString("adminid"));
				admin2.setAdminpw(rs.getString("adminpw"));
				admin2.setAdminnick(rs.getString("adminnick"));
				admin2.setAdminname(rs.getString("adminname"));
				
				
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return admin2;
	}

}
