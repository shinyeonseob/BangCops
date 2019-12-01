package web.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import util.Paging;
import web.dao.face.CommentDao;
import web.dbutil.DBconn;
import web.dto.BBoard;
import web.dto.BUser;
import web.dto.Bcomment;

public class CommentDaoImpl implements CommentDao{

	// DB 연결 객체
	private Connection conn = null;

	// JDBC 객체
	private PreparedStatement ps;
	private ResultSet rs;
	
	@Override
	public void insertComment(Bcomment comment) {
		conn = DBconn.getConnection();
		
		String sql
		= "INSERT INTO Bcomment ("
				+ "		commentno,"
				+ "		idx,"
				+ "		regDate,"
				+ "		contents,"
				+ "		userlevel,"
				+ "		userno )"
				+ "	VALUES ("
				+ "		bcomment_seq.nextval,"
				+ "		?,"
				+ "		sysdate,"
				+ "		?,"
				+ "		1,"
				+ "		? )";
		
		try {
			ps = conn.prepareStatement(sql);
			
			ps.setInt(1, comment.getIdx());
			ps.setString(2, comment.getContents());
//			ps.setInt(3, comment.getUserlevel());
//			ps.setInt(4, comment.getUserno());
			ps.setInt(3, comment.getUserno());
			ps.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(ps!=null)	ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		
		
	}

	@Override
	public List<Bcomment> selectComment(BBoard list) {
		conn = DBconn.getConnection();

		String sql
		= "SELECT * FROM ("
				+ "SELECT rownum rnum, B.* FROM ("
				+ "	SELECT"
				+ "		c.commentno,"
				+ "		c.idx,"
				+ "		c.regDate,"
				+ "		c.contents,"
				+ "		c.userlevel,"
				+ "		c.userno, "
				+ "		u.userid, "
				+ "		u.usernick "
				+ "	FROM Bcomment c , BUser u"
				+ "	WHERE idx = ?"
				+ "	AND c.userno = u.userno"
				+ "	ORDER BY c.commentno"
				+ "	) B"
				+ ") ORDER BY rnum DESC";

		List commentList = new ArrayList();
		
		try {
			ps = conn.prepareStatement(sql);
			
			ps.setInt(1, list.getIdx());
			
			// ResultSet 반환
			rs = ps.executeQuery();
			
			while(rs.next()) {
				Bcomment comment = new Bcomment();
				
				comment.setRnum(rs.getInt("rnum"));
				comment.setCommentno(rs.getInt("commentno"));
				comment.setIdx(rs.getInt("idx"));
				comment.setRegDate(rs.getDate("regDate"));
				comment.setContents(rs.getString("contents"));
				comment.setUserlevel(rs.getInt("userlevel"));
				comment.setUserno(rs.getInt("userno"));
				comment.setUserid(rs.getString("userid"));
				comment.setUsernick(rs.getString("usernick"));
				
				
				commentList.add(comment);
				
				
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
		
		return commentList;
	}

	@Override
	public void deleteComment(Bcomment comment) {
		conn = DBconn.getConnection();

		String sql
		= "DELETE Bcomment"
				+ "	WHERE commentno = ?";
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, comment.getCommentno());
			
			ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(ps!=null)	ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
	}

	@Override
	public int countComment(Bcomment comment) {
		conn = DBconn.getConnection();

		String sql = "SELECT COUNT(*) FROM Bcomment WHERE commentno=?";
		
		int cnt = 0;
		
		try {
			ps = conn.prepareStatement(sql);
			
			ps.setInt(1, comment.getCommentno());
			rs = ps.executeQuery();
			rs.next();
			cnt = rs.getInt(1);
			
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

	@Override
	public List<Bcomment> selectMycomment(Paging paging, BUser userno) {

		conn = DBconn.getConnection();

		

		String sql = "";
		sql += "SELECT * FROM (";
		sql += "	SELECT rownum rnum, B .* FROM (";
		sql += "	SELECT";
		sql += "		c.commentno,";
		sql += "		c.idx,";
		sql += "		c.regDate,";
		sql += "		c.contents,";
		sql += "		c.USERLEVEL,";
		sql += "		c.userno,";
		sql += "		b.title";
		sql += "	FROM Bcomment c , Bboard b";
		sql += "	WHERE c.idx = b.idx";
		sql += "	AND c.userno = ?";
		sql += "	ORDER BY c.commentno desc";
		sql += " ) B ORDER BY rnum";
		sql += " ) Bcomment";
		sql += " WHERE rnum BETWEEN ? AND ?";
		List commentList = new ArrayList();
		try {
			ps = conn.prepareStatement(sql);
			
			ps.setInt(1, userno.getUserno());
			ps.setInt(2, paging.getStartNo());
			ps.setInt(3, paging.getEndNo());
			
			// ResultSet 반환
			rs = ps.executeQuery();
			
			while(rs.next()) {
				Bcomment comment = new Bcomment();
				
				comment.setRnum(rs.getInt("rnum"));
				comment.setCommentno(rs.getInt("commentno"));
				comment.setIdx(rs.getInt("idx"));
				comment.setRegDate(rs.getDate("regDate"));
				comment.setContents(rs.getString("contents"));
				comment.setUserno(rs.getInt("userno"));
				comment.setUserlevel(rs.getInt("userlevel"));
				comment.setTitle(rs.getString("title"));
				
				
				commentList.add(comment);
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
		
		
		return commentList;
	}

	@Override
	public void deleteCommentList(String names) {
		conn = DBconn.getConnection(); //DB 연결

		String sql = "DELETE FROM Bcomment WHERE commentno IN ( "+names+" )";
		
		try {
			ps = conn.prepareStatement(sql);
			
			ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(ps!=null)	ps.close();
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
	}

}
