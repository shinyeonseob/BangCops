package web.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import web.dao.face.AccuseDao;
import web.dbutil.DBconn;
import web.dto.BAccuse;

public class AccuseDaoImpl implements AccuseDao {

	private Connection conn = null;
	
	private PreparedStatement ps = null;
	private ResultSet rs = null;
	

	@Override
	public void insert(BAccuse baccuse) {
		
		conn = DBconn.getConnection(); //DB 연결

		System.out.println(baccuse);
		String sql =  "INSERT INTO BAccuse ( AccuseNo, URL, City, Gu, sitename, AccuseType, idx, Agent, Property, PhoneNo)";
		sql += " VALUES ( BAccuse_SEQ.nextval, ?, ?, ?, ?, ?, ?, ? ,? ,? )";
		
		try {
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, baccuse.getUrl());
			ps.setString(2, baccuse.getCity());
			ps.setString(3, baccuse.getGu());
			ps.setString(4, baccuse.getSitename());
			ps.setString(5, baccuse.getAccusetype());
			ps.setInt(6, baccuse.getIdx());
			ps.setString(7, baccuse.getAgent());
			ps.setString(8, baccuse.getProperty());
			ps.setString(9, baccuse.getPhoneNo());
			
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
	public int selectBoardno() {
		return 0;
	}

	@Override
	public BAccuse selectBoardByBoardno(BAccuse viewABoard) {
		// TODO Auto-generated method stub
		return null;
	}
//
//	@Override
//	public void updateHit(BAccuse viewABoard) {
//		conn = DBconn.getConnection(); //DB 연결
//
//		//게시글 조회수 증가 쿼리
//		String sql = "";
//		sql+="UPDATE board";
//		sql+=" SET hit = hit + 1";
//		sql+=" WHERE boardno = ?";
//	
//		try {
//			ps = conn.prepareStatement(sql);
//			
//			ps.setInt(1, viewABoard.getBoardno());
//			
//			ps.executeUpdate();
//			
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			try {
//				// 자원 해제
//				if(ps!=null)	ps.close();
//			} catch (SQLException e) {
//				e.printStackTrace();
//			}
//		}
//				
//	}

	@Override
	public int selectCntAll(String search) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	@Override
	public void updateHit(BAccuse viewABoard) {
		// TODO Auto-generated method stub
		
	}
	
}

		


