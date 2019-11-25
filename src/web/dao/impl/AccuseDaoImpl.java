package web.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

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
	
}

		


