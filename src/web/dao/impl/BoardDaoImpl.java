package web.dao.impl;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import util.Paging;
import web.dao.face.BoardDao;
import web.dbutil.DBconn;
import web.dto.BAttached;
import web.dto.BBoard;

public class BoardDaoImpl implements BoardDao {
	
	private Connection conn = null; // DB 연결 객체
	private PreparedStatement ps = null; // SQL 수행 객체
	private ResultSet rs = null; // SQL 수행 결과 객체
	
	@Override
	public List<BBoard> selectAll() {
		
		conn = DBconn.getConnection(); //DB 연걸
		
		String sql = "";
		sql = " SELECT * FROM board ORDER BY idx DESC";
		
		List<BBoard> list = new ArrayList<>();
		
		try {
			ps = conn.prepareStatement(sql);
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				
				BBoard boardlist = new BBoard();
				
				boardlist.setIdx(rs.getInt("idx"));
				boardlist.setTitle(rs.getString("title"));
				boardlist.setContents(rs.getString("contents"));
				boardlist.setRegDate(rs.getDate("regDate"));
				boardlist.setHits(rs.getInt("hits"));
				boardlist.setReco(rs.getInt("reco"));
				boardlist.setBoardNo(rs.getInt("boardno"));
				boardlist.setUserNo(rs.getInt("userno"));
				
				list.add(boardlist);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(ps!=null) ps.close();
				if(rs!=null) rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}

	@Override
	public List<BBoard> selectAll(Paging paging) {
		
		conn = DBconn.getConnection(); //DB 연결
		
		// 수행할 쿼리
		String sql = "";
		sql += "SELECT * FROM (";
		sql += "	SELECT rownum rnum, B .* FROM (";
		sql += "	SELECT";
		sql += "		idx,title, contents, hits, reco, boardno, userno, regdate, (SELECT usernick FROM buser WHERE b.userno = userno)usernick ";
		sql += "	FROM Bboard b";
		sql += "	ORDER BY idx DESC";
		sql += " ) B ORDER BY rnum";
		sql += " ) BBoard";
		sql += " WHERE rnum BETWEEN ? AND ?";
		
		List<BBoard> list = new ArrayList<>();
		
		try {
			ps = conn.prepareStatement(sql);

			ps.setInt(1, paging.getStartNo());
			ps.setInt(2, paging.getEndNo());
			
			rs = ps.executeQuery();
			
			while (rs.next()) {
				BBoard bBoard = new BBoard();
				
				bBoard.setIdx(rs.getInt("idx"));
				bBoard.setTitle(rs.getString("title"));
				bBoard.setContents(rs.getString("contents"));
				bBoard.setRegDate(rs.getDate("regdate"));
				bBoard.setHits(rs.getInt("hits"));
				bBoard.setReco(rs.getInt("reco"));
				bBoard.setBoardNo(rs.getInt("BoardNo"));
				bBoard.setUserNo(rs.getInt("UserNo"));
				bBoard.setUsernick(rs.getString("usernick"));

				list.add(bBoard);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int selectCntAll() {
		conn = DBconn.getConnection(); // DB연결

		// 수행할 쿼리
		String sql = "";
		sql += "SELECT ";
		sql += " count(*)";
		sql += " FROM board"; // 추후 편집이 용이해질 수 있도록 컬럼은 다 쓰는게 좋음

		// 결과 저장 리스트
		int cnt = 0;

		try {
			// 쿼리 수행 객체 얻기
			ps = conn.prepareStatement(sql);
			// SQL 수행 및 결과 저장
			rs = ps.executeQuery();
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

		return cnt;
	}

	@Override
	public BBoard selectBoardByBoardno(BBoard bBoard) {
		conn = DBconn.getConnection(); // DB연결
		
		String sql = "";
		sql += " SELECT idx, title, contents, hits, reco, boardno, userno, regdate,";
		sql	+= " (SELECT usernick FROM buser WHERE b.userno = userno)usernick";
		sql += " FROM bboard b WHERE idx = ?";
		try {
			ps = conn.prepareStatement(sql);
			
			ps.setInt(1, bBoard.getIdx());
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				bBoard.setBoardNo(rs.getInt("boardno"));
				bBoard.setIdx(rs.getInt("idx"));
				bBoard.setTitle(rs.getString("title"));
				bBoard.setContents(rs.getString("contents"));
				bBoard.setHits(rs.getInt("hits"));
				bBoard.setUsernick(rs.getString("usernick"));
				bBoard.setReco(rs.getInt("reco"));
				bBoard.setRegDate(rs.getDate("regdate"));
				bBoard.setUserNo(rs.getInt("userNo"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(ps!=null) ps.close();
				if(rs!=null) rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return bBoard;
	}

	@Override
	public void insert(BBoard board) {
		conn = DBconn.getConnection();
		
		String sql = "";
		sql += "INSERT INTO BBoard ( boardno, idx, title, contents, userno, hits, reco )";
		sql += " VALUES ( 1, ?, ?, ?, ?, 0, 0 )";
		
		try {
			ps = conn.prepareStatement(sql);
			
			ps.setInt(1, board.getIdx());
			ps.setString(2, board.getTitle());
			ps.setString(3, board.getContents());
			ps.setInt(4, board.getUserNo());
			
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
	public int selectIdx() {
		conn = DBconn.getConnection();
		
		int idx = 0;
		
		String sql = "";
		sql += "SELECT bboard_seq.nextval FROM dual";
		
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while (rs.next()) {
				idx = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return idx;
	}

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
