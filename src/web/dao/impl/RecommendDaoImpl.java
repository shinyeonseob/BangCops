package web.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import web.dao.face.RecommendDao;
import web.dbutil.DBconn;
import web.dto.BBoard;

public class RecommendDaoImpl implements RecommendDao{
	private Connection conn = null; 
	private PreparedStatement ps = null;
	private ResultSet rs = null;

	@Override
	public int selectCntRecommend(BBoard recommend) {
		conn = DBconn.getConnection();

		String sql = "";
		sql += "SELECT hits FROM BBoard WHERE boardno = ? AND idx =  ?"; 
		
		//DB 객체
		PreparedStatement ps = null; 
		ResultSet rs = null;
		
		int cnt = -1;
		
		try {
			//DB작업
			ps = conn.prepareStatement(sql);
			ps.setInt(1, recommend.getBoardNo());
			ps.setInt(2, recommend.getIdx());

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
	public void insertRecommend(BBoard recommend) {
		conn = DBconn.getConnection();

		String sql = "";
		sql += "INSERT INTO BBoard hits";
		sql += " VALUES ( ? )";
		
		//DB 객체
		PreparedStatement ps = null; 
		
		try {
			//DB작업
			ps = conn.prepareStatement(sql);
			ps.setString(1, recommend.getUserid());
			ps.setInt(2, recommend.getBoardNo());

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
	public void deleteRecommend(BBoard recommend) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int selectTotalCntRecommend(BBoard recommend) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	
}
