package web.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import util.Paging;
import web.dao.face.AdminAaccuseDao;
import web.dbutil.DBconn;
import web.dto.BAccuse;
import web.dto.BAccuse2;
import web.dto.BBoard;

public class AdminAaccuseDaoImpl implements AdminAaccuseDao {

	private Connection conn = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;

	@Override
	public List<BAccuse2> getListBAccuse(Paging paging) {
		conn = DBconn.getConnection(); // DB 연결

		// 수행할 쿼리
		String sql = "";
		sql += "SELECT * FROM (";
		sql += "	SELECT rownum rnum, B.* FROM (";
		sql += "	SELECT";
		sql += "		a.ACCUSENO , a.URL , a.CITY , a.GU , a.SITENAME , a.ACCUSETYPE , a.IDX , a.AGENT , a.PROPERTY , a.PHONENO";
		sql += "		,b.Title , b.Contents, b.RegDate, b.UserNo, b.UserNick";
		sql += "	FROM Bboard b, BAccuse a";
		sql += "	WHERE b.idx = a.idx AND a.gu LIKE '%'||?||'%'";
		sql += "	ORDER BY idx DESC";
		sql += " ) B ORDER BY rnum";
		sql += " ) BBoard";
		sql += " WHERE rnum BETWEEN ? AND ?";

		List<BAccuse2> list = new ArrayList<>();

		try {
			ps = conn.prepareStatement(sql);

			ps.setString(1, paging.getSearch());
			ps.setInt(2, paging.getStartNo());
			ps.setInt(3, paging.getEndNo());

			rs = ps.executeQuery();

			while (rs.next()) {
				BAccuse2 bAccuse = new BAccuse2();

				bAccuse.setAccuseno(rs.getInt("AccuseNo"));
				bAccuse.setUrl(rs.getString("URL"));
				bAccuse.setCity(rs.getString("City"));
				bAccuse.setGu(rs.getString("Gu"));
				bAccuse.setSitename(rs.getString("sitename"));
				bAccuse.setAccusetype(rs.getString("AccuseType"));
				bAccuse.setIdx(rs.getInt("idx"));
				bAccuse.setAgent(rs.getString("Agent"));
				bAccuse.setProperty(rs.getString("Property"));
				bAccuse.setPhoneNo(rs.getString("PhoneNo"));
				
				bAccuse.setTitle(rs.getString("title"));
				bAccuse.setContents(rs.getString("contents"));
				bAccuse.setRegDate(rs.getDate("regdate"));
				bAccuse.setUserNo(rs.getInt("UserNo"));
				bAccuse.setUsernick(rs.getString("usernick"));

				System.out.println("bAccuse : " + bAccuse);

				list.add(bAccuse);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public void deleteBAccuse(String accuseno) {
		conn = DBconn.getConnection();

		String sql = "DELETE FROM BAccuse WHERE accuseno = ?";

		try {
			ps = conn.prepareStatement(sql);

			ps.setInt(1, Integer.parseInt(accuseno));

			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (ps != null)
					ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	@Override
	public void deleteBBoard(int idx) {
		conn = DBconn.getConnection();

		String sql = "DELETE FROM BBoard WHERE idx = ?";

		try {
			ps = conn.prepareStatement(sql);

			ps.setInt(1, idx);

			ps.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (ps != null)
					ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	@Override
	public int selectidxtoaccuseno(String accuseno) {
		conn = DBconn.getConnection();

		String sql = "SELECT * FROM BAccuse WHERE accuseno = ?";

		int idx = 0;
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, Integer.parseInt(accuseno));
			rs = ps.executeQuery();

			while (rs.next()) {
				idx = rs.getInt("idx");
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return idx;
	}

	@Override
	public void deleteBDeal(String accuseno) {
		conn = DBconn.getConnection();

		String sql = "DELETE FROM BDeal WHERE accuseno = ?";

		try {
			ps = conn.prepareStatement(sql);

			ps.setInt(1, Integer.parseInt(accuseno));

			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (ps != null)
					ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	@Override
	public void deleteBAttached(int idx) {
		conn = DBconn.getConnection();

		String sql = "DELETE FROM BAttached WHERE idx = ?";

		try {
			ps = conn.prepareStatement(sql);

			ps.setInt(1, idx);

			ps.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (ps != null)
					ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	@Override
	public BAccuse2 getBAccuse2(HttpServletRequest req) {
		conn = DBconn.getConnection(); // DB 연결
		String sql = "SELECT a.ACCUSENO , a.URL , a.CITY , a.GU , a.SITENAME , a.ACCUSETYPE , a.IDX , a.AGENT , a.PROPERTY , a.PHONENO, b.Title , b.Contents, b.RegDate, b.UserNo, b.UserNick	FROM Bboard b, BAccuse a WHERE b.idx=a.idx and a.accuseno = ?";
		
		BAccuse2 bAccuse = new BAccuse2();
		try {
			ps = conn.prepareStatement(sql);
			
			ps.setInt(1, Integer.parseInt(req.getParameter("accuseno")));
			rs = ps.executeQuery();


			while (rs.next()) {
				bAccuse.setAccuseno(rs.getInt("AccuseNo"));
				bAccuse.setUrl(rs.getString("URL"));
				bAccuse.setCity(rs.getString("City"));
				bAccuse.setGu(rs.getString("Gu"));
				bAccuse.setSitename(rs.getString("sitename"));
				bAccuse.setAccusetype(rs.getString("AccuseType"));
				bAccuse.setIdx(rs.getInt("idx"));
				bAccuse.setAgent(rs.getString("Agent"));
				bAccuse.setProperty(rs.getString("Property"));
				bAccuse.setPhoneNo(rs.getString("PhoneNo"));
				
				bAccuse.setTitle(rs.getString("title"));
				bAccuse.setContents(rs.getString("contents"));
				bAccuse.setRegDate(rs.getDate("regdate"));
				bAccuse.setUserNo(rs.getInt("UserNo"));
				bAccuse.setUsernick(rs.getString("usernick"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		
		return bAccuse;
	}
}
