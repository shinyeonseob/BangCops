package web.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import web.dao.face.BoardFileDao;
import web.dbutil.DBconn;
import web.dto.BAttached;
import web.dto.BBoard;

public class BoardFileDaoImpl implements BoardFileDao {
	private Connection conn = null; // DB 연결 객체
	private PreparedStatement ps = null; // SQL 수행 객체
	private ResultSet rs = null; // SQL 수행 결과 객체
	
	@Override
	public void insertFile(BAttached bAttached) {
		conn = DBconn.getConnection();
		
		String sql = "";
		sql += "INSERT INTO BAttached(fileno, idx, originname, storedname, fileroot, writedate)";
		sql += " VALUES(BAttached_seq.nextval, ?, ?, ?, ?, sysdate )";
		
		try {
			ps = conn.prepareStatement(sql);
			
			ps.setInt(1, bAttached.getIdx());
			ps.setString(2, bAttached.getOriginName());
			ps.setString(3, bAttached.getStoredName());
			ps.setString(4, bAttached.getFileRoot());
			
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
	public BAttached selectFile(BBoard bBoard) {
		conn = DBconn.getConnection();
		
		BAttached bAttached = new BAttached();
		
		String sql = "";
		sql += "SELECT * FROM BAttached WHERE idx = ?";
		
		try {
			ps = conn.prepareStatement(sql);
			
			ps.setInt(1, bBoard.getIdx());
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				
				bAttached.setIdx(rs.getInt("idx"));
				bAttached.setFileNo(rs.getInt("fileNo"));
				bAttached.setOriginName(rs.getString("originName"));
				bAttached.setStoredName(rs.getString("storedName"));
				bAttached.setFileRoot(rs.getString("fileRoot"));
				bAttached.setWriteDate(rs.getDate("writeDate"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(ps!=null) ps.close();
				if(rs!=null) rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return bAttached;
	}
}
