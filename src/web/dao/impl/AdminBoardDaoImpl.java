package web.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import util.Paging;
import web.dao.face.AdminBoardDao;
import web.dbutil.DBconn;
import web.dto.BBoard;

public class AdminBoardDaoImpl implements AdminBoardDao {
	
	private Connection conn = null; // DB 연결 객체
	private PreparedStatement ps = null; // SQL 수행 객체
	private ResultSet rs = null; // SQL 수행 결과 객체

	@Override
	public List<BBoard> selecAll(Paging paging, HttpServletRequest req) {

		conn = DBconn.getConnection(); //DB 연결
		
		HttpSession session = req.getSession();
		
		// 쿼리 수행
		String sql = "";
		sql += "SELECT * FROM (";
		sql += "    SELECT rownum rnum, B.* FROM (";
		sql += "        SELECT";
		sql += " 			idx, userno, boardno, title, contents, regdate, (SELECT userid FROM BUser WHERE userno=bboard.userno) userid";
		sql += "        FROM bboard WHERE userno = ? ";
		
//		if(paging.getSearch()!=null&&!"".equals(paging.getSearch())) {			
//			sql	+=	"        AND title LIKE ?";
//		}
		
		sql += "        ORDER BY idx DESC";
		sql += "    ) B";
		sql += "    ORDER BY rnum";
		sql += " ) bboard";
		sql += " WHERE rnum BETWEEN ? AND ?";

		List<BBoard> userBlist = new ArrayList<>();

		try {
			ps=conn.prepareStatement(sql);

//			if(paging.getSearch()!=null&&!"".equals(paging.getSearch())) {
//			
//			ps.setInt(1,  Integer.parseInt(req.getParameter("userno") ));
//			ps.setString(2, "%"+paging.getSearch()+"%");
//			ps.setInt(3, paging.getStartNo());
//			ps.setInt(4, paging.getEndNo());
//
//			}else{
			ps.setInt(1, Integer.parseInt(req.getParameter("userno") ));
			ps.setInt(2, paging.getStartNo());
			ps.setInt(3, paging.getEndNo());
//			}
			rs=ps.executeQuery();

			while(rs.next()) {
				BBoard bboard = new BBoard();

				bboard.setIdx(rs.getInt("idx"));
				bboard.setUserNo(rs.getInt("userno"));
				bboard.setRegDate(rs.getDate("regdate"));
				bboard.setBoardNo(rs.getInt("boardno"));
				bboard.setUserid(rs.getString("userid"));
				bboard.setTitle(rs.getString("title"));
				bboard.setContents(rs.getString("contents"));
				
				userBlist.add(bboard);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

			try {
				if(ps!=null)	ps.close();
				if(ps!=null)	rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return userBlist;
		
	}

	@Override
	public int selectCntAll(HttpServletRequest req) {

		conn = DBconn.getConnection(); //DB 연결
		
		HttpSession session = req.getSession();
		
		// 쿼리 수행
		String sql = "";
		sql += "SELECT count(*) FROM bboard";
		sql += " WHERE userno=?";
//		if (req.getParameter("search") != null && !"".equals(req.getParameter("search"))) {
//
//			sql += " AND recipename LIKE ?";
//		}
		sql += " ORDER BY idx DESC";

		int cnt = 0;

		try {
			ps = conn.prepareStatement(sql);

			ps.setInt(1, Integer.parseInt(req.getParameter("userno")));
//			if (req.getParameter("search") != null && !"".equals(req.getParameter("search"))) {
//
//				ps.setString(2, "%" + req.getParameter("search") + "%");
//			}

			rs = ps.executeQuery();

			if (rs.next()) {
				cnt = rs.getInt(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

			try {
				if (ps != null)
					ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return cnt;
		
	}

	@Override
	public BBoard selecBoardByBoardno(HttpServletRequest req) {

		conn = DBconn.getConnection(); //DB 연결
		
		String sql="";
		sql+="SELECT * FROM bboard WHERE boardno = ?";

		BBoard bboard = new BBoard();

		try {
			ps = conn.prepareStatement(sql);

			ps.setInt(1, Integer.parseInt(req.getParameter("boardno")));

			rs= ps.executeQuery();
			if(rs.next()) {

				bboard.setUserNo(rs.getInt("userno"));
				bboard.setBoardNo(rs.getInt("boardno"));
				bboard.setUserid(rs.getString("userid"));
				bboard.setTitle(rs.getString("title"));
				bboard.setContents(rs.getString("contents"));

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

			try {
				if(ps!=null)	ps.close();
				if(ps!=null)	rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return bboard;
		
	}

	@Override
	public void deleteBoard(HttpServletRequest req) {

		conn = DBconn.getConnection(); //DB 연결
		
		String sql ="";
		sql+=" UPDATE bboard ";
		sql+=" title ='삭제된 글 입니다',";
		sql+=" title=''";
		sql+=" WHERE boardno=?";
		
		try {
			ps= conn.prepareStatement(sql);
			ps.setInt(1, Integer.parseInt(req.getParameter("boardno")));

			ps.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

			try {
				if(ps!=null)	ps.close();
				if(ps!=null)	rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

}
