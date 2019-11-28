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

		//다음 게시글 번호 조회 쿼리
		
		String sql = "";
	//	sql += "INSERT INTO board(BOARDNO,TITLE,ID,CONTENT,HIT) ";
	//	sql += " VALUES (?, ?, ?, ?, 0)";
		
		
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

		


