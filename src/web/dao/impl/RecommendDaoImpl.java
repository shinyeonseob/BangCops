package web.dao.impl;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import web.dao.face.RecommendDao;
import web.dbutil.DBconn;
import web.dto.BBoard;
import web.dto.Recommend;

public class RecommendDaoImpl implements RecommendDao{
	private Connection conn = null; 
	private PreparedStatement ps = null;
	private ResultSet rs = null;

	@Override
	public int selectCntRecommend(Recommend recommend) {
		conn = DBconn.getConnection();

		String sql = "";
		sql += "SELECT count(*) FROM recommend WHERE idx = ? AND userno =  ?"; 
		
		//DB 객체
		PreparedStatement ps = null; 
		ResultSet rs = null;
		
		int cnt = -1;
		
		try {
			//DB작업
			ps = conn.prepareStatement(sql);
			ps.setInt(1, recommend.getIdx());
			ps.setInt(2, recommend.getUserno());

			rs = ps.executeQuery();
			
			while(rs.next()) {
			
				cnt = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				//DB객체 닫기
				if(ps!=null)	ps.close();
				if(rs!=null)	rs.close();
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return cnt;
	}

	@Override
	public void insertRecommend(Recommend recommend) {
		conn = DBconn.getConnection();

		String sql = "";
		sql += "INSERT INTO Recommend";
		sql += " VALUES ( ?,? )";
		
		//DB 객체
		PreparedStatement ps = null; 
		
		try {
			//DB작업
			ps = conn.prepareStatement(sql);
			ps.setInt(1, recommend.getIdx());
			ps.setInt(2, recommend.getUserno());

			ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				//DB객체 닫기
				if(ps!=null)	ps.close();
				if(rs!=null)	rs.close();
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	@Override
	public void deleteRecommend(Recommend recommend) {
		conn = DBconn.getConnection();

		String sql = "";
		sql += "DELETE recommend";
		sql += " WHERE userno = ?";
		sql += " 	AND idx = ?";
		
		//DB 객체
		PreparedStatement ps = null; 
		
		try {
			//DB작업
			ps = conn.prepareStatement(sql);
			ps.setInt(1, recommend.getUserno());
			ps.setInt(2, recommend.getIdx());

			ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				//DB객체 닫기
				if(ps!=null)	ps.close();
				if(rs!=null)	rs.close();
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
	}

	@Override
	public int selectTotalCntRecommend(Recommend recommend) {
		conn = DBconn.getConnection();
		System.out.println("recommend : " + recommend);
		String sql = "SELECT COUNT(*) FROM recommend WHERE idx = ?";
		
		int cnt = 0;
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, recommend.getIdx());
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				cnt = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return cnt;
	}
	
	
}
