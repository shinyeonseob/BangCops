package web.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import util.Paging;
import web.dao.face.AccuseDao;
import web.dbutil.DBconn;
import web.dto.AccuseMap;
import web.dto.BAccuse;
import web.dto.BBoard;
import web.dto.BDeal;

public class AccuseDaoImpl implements AccuseDao {

	private Connection conn = null;

	private PreparedStatement ps = null;
	private ResultSet rs = null;

	@Override
	public void insert(BAccuse baccuse) {

		conn = DBconn.getConnection(); // DB 연결

		System.out.println(baccuse);
		String sql = "INSERT INTO BAccuse ( AccuseNo, URL, City, Gu, sitename, AccuseType, idx, Agent, Property, PhoneNo)";
		sql += " VALUES ( ?, ?, ?, ?, ?, ?, ?, ? ,? ,? )";

		try {
			ps = conn.prepareStatement(sql);

			ps.setInt(1, baccuse.getAccuseno());
			ps.setString(2, baccuse.getUrl());
			ps.setString(3, baccuse.getCity());
			ps.setString(4, baccuse.getGu());
			ps.setString(5, baccuse.getSitename());
			ps.setString(6, baccuse.getAccusetype());
			ps.setInt(7, baccuse.getIdx());
			ps.setString(8, baccuse.getAgent());
			ps.setString(9, baccuse.getProperty());
			ps.setString(10, baccuse.getPhoneNo());

			ps.executeUpdate();

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

	@Override
	public int selectAccuseNo() {

		conn = DBconn.getConnection();

		int AccuseNo = 0;

		String sql = "";
		sql += "SELECT BAccuse_SEQ.nextval FROM dual";

		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();

			while (rs.next()) {
				AccuseNo = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return AccuseNo;
	}

	@Override
	public void insertBDeal(BDeal bDeal) {
		conn = DBconn.getConnection(); // DB 연결

		System.out.println(bDeal);
		String sql = "INSERT INTO BDeal ( BDealNo, DealType2, Deposit, Price, AccuseNo)";
		sql += " VALUES ( BDeal_SEQ.nextval, ?, ?, ?, ?)";

		try {
			ps = conn.prepareStatement(sql);

			ps.setString(1, bDeal.getDealtype2());
			ps.setInt(2, bDeal.getDeposit());
			ps.setInt(3, bDeal.getPrice());
			ps.setInt(4, bDeal.getAccuseno());
			
			ps.executeUpdate();


		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public List<BAccuse> getSearchListBAccuse(Paging paging, HttpServletRequest req) {

		System.out.println("getSearchListBAccuse");
		conn = DBconn.getConnection(); // DB 연결

		// 수행할 쿼리
		String sql = "";
		sql += "SELECT * FROM (";
		sql += "	SELECT rownum rnum, B.* FROM (";
		sql += "	SELECT";
		sql += "		a.ACCUSENO , a.URL , a.CITY , a.GU , a.SITENAME , a.ACCUSETYPE , a.IDX , a.AGENT , a.PROPERTY , a.PHONENO";
		sql += "	FROM Bboard b, BAccuse a";
		sql += "	WHERE b.idx = a.idx AND City = ? AND Gu = ? AND Contents LIKE '%'||?||'%'";
		sql += "	ORDER BY idx DESC";
		sql += " ) B ORDER BY rnum";
		sql += " ) BBoard";
		sql += " WHERE rnum BETWEEN ? AND ?";

		List<BAccuse> list = new ArrayList<>();

		try {
			ps = conn.prepareStatement(sql);

			System.out.println(req.getParameter("city"));
			System.out.println(req.getParameter("gu"));
			System.out.println(req.getParameter("search"));
			System.out.println(paging.getStartNo());
			System.out.println(paging.getEndNo());

			ps.setString(1, req.getParameter("city"));
			ps.setString(2, req.getParameter("gu"));
			ps.setString(3, req.getParameter("search"));
			ps.setInt(4, paging.getStartNo());
			ps.setInt(5, paging.getEndNo());

			rs = ps.executeQuery();

			while (rs.next()) {
				BAccuse bAccuse = new BAccuse();

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
	public List<BBoard> selectSearchAll(Paging paging, int boardno) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public BAccuse getbaccuse(BAccuse baccuse) {
		conn = DBconn.getConnection(); // DB 연결

		String sql = "SELECT * FROM BAccuse WHERE accuseno = ?";
		BAccuse bAccuse = new BAccuse();

		try {
			ps = conn.prepareStatement(sql);

			ps.setInt(1, baccuse.getAccuseno());

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

				System.out.println("bAccuse : " + bAccuse);

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return bAccuse;
	}

	@Override
	public BDeal getBdeal(BAccuse accuse) {
		conn = DBconn.getConnection(); // DB 연결
		
		System.out.println("accuse.getAccuseno() : "+ accuse.getAccuseno());

		String sql = "SELECT * FROM BDeal WHERE AccuseNo = ?";
		BDeal bDeal = new BDeal();

		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, accuse.getAccuseno());

			rs = ps.executeQuery();

			while (rs.next()) {

				bDeal.setBdealno(rs.getInt("BDealNo"));
				bDeal.setAccuseno(rs.getInt("AccuseNo"));
				bDeal.setDealtype2(rs.getString("DealType2"));
				bDeal.setDeposit(rs.getInt("deposit"));
				bDeal.setPrice(rs.getInt("price"));

				System.out.println("bAccuse : " + bDeal);

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return bDeal;
	}


	public List getGuname(BAccuse baccuse) {
		conn = DBconn.getConnection(); // DB 연결

		// 수행할 쿼리
		String sql = "";
		sql += "SELECT Distinct Gu FROM BAccuse";

		List<BAccuse> list = new ArrayList();
		try {
			ps=conn.prepareStatement(sql);

			rs = ps.executeQuery();

			while(rs.next()) {
				BAccuse bAccuse = new BAccuse();

				bAccuse.setGu(rs.getString("Gu"));

				list.add(bAccuse);

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(ps != null) ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return list;

	}

	@Override
	public int getTotalaccuse(String gu) {
		conn = DBconn.getConnection(); // DB 연결

		int num = 0;
		String sql = "";
		sql += "SELECT count(*) FROM BAccuse";
		sql += " WHERE Gu = ?";

		try {
			ps = conn.prepareStatement(sql);

			ps.setString(1, gu);

			rs = ps.executeQuery();

			rs.next();

			num = rs.getInt("count(*)");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(ps != null) ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}


		return num;
	}

	@Override
	public int getTotalagent(String gu) {
		conn = DBconn.getConnection(); // DB 연결

		int num = 0;
		
		String sql = "";
		sql += "SELECT count(*) FROM (";
		sql += " select distinct agent  from baccuse where gu= ?)";
		
		try {
			ps = conn.prepareStatement(sql);

			ps.setString(1, gu);

			rs = ps.executeQuery();

			rs.next();

			num = rs.getInt("count(*)");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(ps != null) ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return num;
	}

	@Override
	public AccuseMap getLocation(String gu) {
		conn = DBconn.getConnection(); // DB 연결
		
		String sql = "";
		sql += "SELECT * FROM Bmap WHERE guname = ?";
		
		
		AccuseMap acm = new AccuseMap();
		try {
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, gu);
			
			rs = ps.executeQuery();
			
			while(rs.next()) {

				acm.setGuname(rs.getString("guname"));
				acm.setLat(rs.getDouble("lat"));
				acm.setLng(rs.getDouble("lng"));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(ps != null) ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return acm;
	}

	@Override
	public BAccuse selectCountByDailyAccuse() {
		// TODO Auto-generated method stub
		return null;
	};

}
