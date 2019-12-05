package web.dao.impl;

import java.sql.Connection;



import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import util.Paging;
import web.dao.face.BoardDao;
import web.dbutil.DBconn;
import web.dto.BAttached;
import web.dto.BBoard;
import web.dto.BBoardAndBboardType;
import web.dto.BUser;

public class BoardDaoImpl implements BoardDao {
	
	private Connection conn = null; // DB 연결 객체
	private PreparedStatement ps = null; // SQL 수행 객체
	private ResultSet rs = null; // SQL 수행 결과 객체
	
	@Override
	public List<BBoard> selectAll(int boardno) {
		
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
	public List<BBoard> selectAll(Paging paging,int boardno) {
		
		conn = DBconn.getConnection(); //DB 연결
		

		String sql= "SELECT * FROM (";
		sql +=			" SELECT rownum rnum, B .* FROM (";
		sql +=				" SELECT";
		sql +=					" idx,title, contents, hits, boardno, userno, regdate, usernick,"; 
		sql +=					" ( SELECT COUNT(*) FROM recommend WHERE B.idx = idx )reco,";
		sql +=					" ( SELECT COUNT(*) FROM Bcomment WHERE B.idx = idx )commentCnt";
		sql +=				" FROM Bboard b";
		sql +=				" WHERE boardno = ?";
		sql +=				" ORDER BY idx DESC";
		sql +=			" ) B ORDER BY rnum";
		sql +=		" ) BBoard";
		sql +=		" WHERE rnum BETWEEN ? AND ?";

		//where to_char( 대상 테이블 컬럼, 'yyyymmdd' ) = to_char( sysdate, 'yyyymmdd'); // --> 당일조건으로 출력 

		List<BBoard> list = new ArrayList<>();
		
		try {
			ps = conn.prepareStatement(sql);
			
			ps.setInt(1, boardno);
			ps.setInt(2, paging.getStartNo());
			ps.setInt(3, paging.getEndNo());
			
			rs = ps.executeQuery();
			
			while (rs.next()) {
				BBoard bBoard = new BBoard();
				
				bBoard.setIdx(rs.getInt("rnum"));
				bBoard.setIdx(rs.getInt("idx"));
				bBoard.setTitle(rs.getString("title"));
				bBoard.setContents(rs.getString("contents"));
				bBoard.setRegDate(rs.getDate("regdate"));
				bBoard.setHits(rs.getInt("hits"));
				bBoard.setReco(rs.getInt("reco"));
				bBoard.setBoardNo(rs.getInt("BoardNo"));
				bBoard.setUserNo(rs.getInt("UserNo"));
				bBoard.setUsernick(rs.getString("usernick"));
				bBoard.setCommentCnt(rs.getInt("commentCnt"));

				list.add(bBoard);
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
		System.out.println(list);
		return list;
	}
	
	@Override
	public List<BBoard> selectSearchAll(Paging paging, int boardno) {
		
		conn = DBconn.getConnection(); //DB 연결
				
		String sql= "SELECT * FROM (";
		sql +=			" SELECT rownum rnum, B .* FROM (";
		sql +=				" SELECT";
		sql +=					" idx,title, contents, hits, boardno, userno, regdate, usernick,"; 
		sql +=					" ( SELECT COUNT(*) FROM recommend WHERE B.idx = idx )reco,";
		sql +=					" ( SELECT COUNT(*) FROM Bcomment WHERE B.idx = idx )commentCnt";
		sql +=				" FROM Bboard b";
		sql +=				" WHERE boardno = ? AND " + paging.getSearchcategory() +" LIKE '%'||?||'%'";
		sql +=				" ORDER BY idx DESC";
		sql +=			" ) B ORDER BY rnum";
		sql +=		" ) BBoard";
		sql +=		" WHERE rnum BETWEEN ? AND ?";
		List<BBoard> list = new ArrayList<>();

		try {
			ps = conn.prepareStatement(sql);
			
			ps.setInt(1, boardno);
			ps.setString(2,paging.getSearchtarget());
			ps.setInt(3, paging.getStartNo());
			ps.setInt(4, paging.getEndNo());
			
			rs = ps.executeQuery();
			
			while (rs.next()) {
				BBoard bBoard = new BBoard();
				
				bBoard.setIdx(rs.getInt("rnum"));
				bBoard.setIdx(rs.getInt("idx"));
				bBoard.setTitle(rs.getString("title"));
				bBoard.setContents(rs.getString("contents"));
				bBoard.setRegDate(rs.getDate("regdate"));
				bBoard.setHits(rs.getInt("hits"));
				bBoard.setReco(rs.getInt("reco"));
				bBoard.setBoardNo(rs.getInt("BoardNo"));
				bBoard.setUserNo(rs.getInt("UserNo"));
				bBoard.setUsernick(rs.getString("usernick"));

//				System.out.println(bBoard);
				list.add(bBoard);
			}
			
		} catch (SQLException e) {
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
		sql += " FROM Bboard"; // 추후 편집이 용이해질 수 있도록 컬럼은 다 쓰는게 좋음

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
	public int selectCntAll(String search) {
		
		conn = DBconn.getConnection();
		
		String sql = "";
		sql ="SELECT count(*) FROM bboard WHERE boardno = ? AND ? LIKE '%'||?||'%'";
		
		int cnt = 0;
		
		try {
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, search);
			ps.setString(2, search);
			
			rs = ps.executeQuery();
			
			while( rs.next() ) {
				cnt = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null) rs.close();
				if(ps!=null) ps.close();
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
	public List<BBoardAndBboardType> selectMyboard(Paging paging, BUser userno) {

//		System.out.println("1");
		conn = DBconn.getConnection(); //DB 연결
		
		// 수행할 쿼리
		String sql = "";
		sql += "SELECT * FROM (";
		sql += "	SELECT rownum rnum, B .* FROM (";
		sql += "	SELECT";
		sql += "		b.idx,b.title, b.contents, b.hits, b.reco, b.boardno, b.userno, b.regdate ";
		sql += "		, t.boardname";
		sql += "	FROM Bboard b , Bboardtype t";
		sql += "	WHERE b.boardno = t.boardno";
		sql += "	AND userno = ? ";
		sql += "	ORDER BY idx DESC";
		sql += " ) B ORDER BY rnum";
		sql += " ) BBoard";
		sql += " WHERE rnum BETWEEN ? AND ?";
		
		List<BBoardAndBboardType> list = new ArrayList<>();
		
		try {
//			System.out.println("2");
			ps = conn.prepareStatement(sql);

			ps.setInt(1, userno.getUserno());
			ps.setInt(2, paging.getStartNo());
			ps.setInt(3, paging.getEndNo());
//			System.out.println("3");
			rs = ps.executeQuery();
//			System.out.println("4");
			while (rs.next()) {
//				BBoard bBoard = new BBoard();
				BBoardAndBboardType myboard = new BBoardAndBboardType();
				
				myboard.setRnum(rs.getInt("rnum"));
				myboard.setIdx(rs.getInt("idx"));
				myboard.setTitle(rs.getString("title"));
				myboard.setContents(rs.getString("contents"));
				myboard.setRegDate(rs.getDate("regdate"));
				myboard.setHits(rs.getInt("hits"));
				myboard.setReco(rs.getInt("reco"));
				myboard.setBoardNo(rs.getInt("BoardNo"));
				myboard.setUserNo(rs.getInt("UserNo"));
				myboard.setBoardname(rs.getString("boardname"));

//				System.out.println("5");
				list.add(myboard);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
//		System.out.println("6");
		return list;
	}

	public void insert(BBoard board) {
		conn = DBconn.getConnection();
		
		String sql = "";
		sql += "INSERT INTO BBoard ( boardno, idx, title, contents, userno, usernick, hits, reco )";
		sql += " VALUES ( ?, ?, ?, ?, ?, ?, 0, 0 )";
		
		try {
			ps = conn.prepareStatement(sql);
			
			ps.setInt(1, board.getBoardNo());
			ps.setInt(2, board.getIdx());
			ps.setString(3, board.getTitle());
			ps.setString(4, board.getContents());
			ps.setInt(5, board.getUserNo());
			ps.setString(6, board.getUsernick());
			
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
	public void updateHit(BBoard bBoard) {
		conn = DBconn.getConnection(); // DB연결

		// 수행할 쿼리
		String sql = "";
		sql += "UPDATE Bboard SET hits = hits + 1 WHERE idx = ?";

		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, bBoard.getIdx());
			rs = ps.executeQuery();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (ps != null)
					ps.close();
				if (rs != null)
					rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	@Override
	public void delete(BBoard bBoard) {
		conn = DBconn.getConnection();
		
		String sql = "";
		sql += "DELETE FROM Bboard WHERE idx = ?";
		
		try {
			ps = conn.prepareStatement(sql);
			
			ps.setInt(1, bBoard.getIdx());
			
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
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
	public int selectCntBoard(HttpServletRequest req, int boardno) {
		conn = DBconn.getConnection(); // DB 연결
		
		if(req.getParameter("searchcategory")!=null) {
			String sql ="";
			sql += "SELECT count(*) FROM bboard WHERE boardno = ? AND " + req.getParameter("searchcategory") + " LIKE '%'||?||'%'";
			
			int cnt = 0;
			
			try {
				ps = conn.prepareStatement(sql);
				
				ps.setInt(1, boardno);
				ps.setString(2, req.getParameter("searchtarget"));
				
				rs = ps.executeQuery();
				
				while(rs.next()) {
					cnt = rs.getInt(1);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return cnt;
			
		} else {
			String sql = "SELECT count(*) FROM Bboard where boardno = ?";
			
			int cnt = 0;
			
			try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, boardno);
			
			rs = ps.executeQuery(); // SQL 수행결과 얻기
			
			while (rs.next()) {
				cnt = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
			
			
		}
		
	}

	@Override
	public String getboardname(int boardno) {
		conn = DBconn.getConnection();
		
		String sql = "SELECT * FROM bboardtype WHERE boardno = ?";
		
		String boardname = null;
		
		try {
			ps = conn.prepareStatement(sql);
			
			ps.setInt(1, boardno);
			
			rs = ps.executeQuery();
			
			while (rs.next()) {
				boardname = rs.getString("boardno");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return boardname;
	}


	@Override
	public void update(BBoard bBoard) {
		
		String sql = "";
		sql += "UPDATE bboard";
		sql += " SET title = ?,";
		sql += " 	contents = ?,";
		sql += "    boardno = ?";
		sql += " WHERE idx = ?";
		
		//DB 객체
		PreparedStatement ps = null; 
		
		try {
			//DB작업
			ps = conn.prepareStatement(sql);
			ps.setString(1, bBoard.getTitle());
			ps.setString(2, bBoard.getContents());
			ps.setInt(3, bBoard.getBoardNo());
			ps.setInt(4, bBoard.getIdx());

			ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			try {
				//DB객체 닫기
				if(ps!=null) ps.close();
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	@Override
	public List<BBoard> selectFreeboardByReco(int cnt) {
		conn = DBconn.getConnection();
		
		String sql = "";
		sql += " select * from (";
		sql += "	    select"; 
		sql += " 	         idx,title, contents, hits, boardno, userno, regdate, usernick,"; 
		sql += "	        ( SELECT count(*) FROM recommend WHERE B.idx = idx )reco,";
		sql += "	        ( SELECT COUNT(*) FROM Bcomment WHERE B.idx = idx )commentcnt";
		sql += "	    from Bboard b WHERE boardno = 1 order by reco desc)";
		sql += "	where rownum <= ?";  
		
		List<BBoard> list = new ArrayList<>();
		
		try {
			ps = conn.prepareStatement(sql);
			
			ps.setInt(1, cnt);
			
			rs = ps.executeQuery();
			
			while (rs.next()) {
				BBoard bBoard = new BBoard();
				
				bBoard.setIdx(rs.getInt("idx"));
				bBoard.setTitle(rs.getString("title"));
				bBoard.setReco(rs.getInt("reco"));
				bBoard.setRegDate(rs.getDate("regDate"));
				bBoard.setCommentCnt(rs.getInt("commentcnt"));
				bBoard.setUsernick(rs.getString("usernick"));
				
				list.add(bBoard);
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
		
		return list;
	}

	@Override
	public List<BBoard> selectReviewByReco(int cnt) {
		conn = DBconn.getConnection();
		
		String sql = "";
		sql += " select * from (";
		sql += "	    select"; 
		sql += " 	         idx,title, contents, hits, boardno, userno, regdate, usernick,"; 
		sql += "	        ( SELECT count(*) FROM recommend WHERE B.idx = idx )reco,";
		sql += "	        ( SELECT COUNT(*) FROM Bcomment WHERE B.idx = idx )commentcnt";
		sql += "	    from Bboard b WHERE boardno = 2 order by reco desc)";
		sql += "	where rownum <= ?";  
		
		List<BBoard> list = new ArrayList<>();
		
		try {
			ps = conn.prepareStatement(sql);
			
			ps.setInt(1, cnt);
			
			rs = ps.executeQuery();
			
			while (rs.next()) {
				BBoard bBoard = new BBoard();
				
				bBoard.setIdx(rs.getInt("idx"));
				bBoard.setTitle(rs.getString("title"));
				bBoard.setReco(rs.getInt("reco"));
				bBoard.setRegDate(rs.getDate("regDate"));
				bBoard.setCommentCnt(rs.getInt("commentcnt"));
				bBoard.setUsernick(rs.getString("usernick"));
				
				list.add(bBoard);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	@Override
	public List<BBoard> selectNoticeByRegdate(int cnt) {
		conn = DBconn.getConnection();
		
		String sql = "";
		sql += " select * from (";
		sql += "	    select"; 
		sql += " 	         idx,title, contents, hits, boardno, userno, regdate, usernick,"; 
		sql += "	        ( SELECT count(*) FROM recommend WHERE B.idx = idx )reco,";
		sql += "	        ( SELECT COUNT(*) FROM Bcomment WHERE B.idx = idx )commentcnt";
		sql += "	    from Bboard b WHERE boardno = 3 order by regdate desc)";
		sql += "	where rownum <= ?";  
		
		List<BBoard> list = new ArrayList<>();
		
		try {
			ps = conn.prepareStatement(sql);
			
			ps.setInt(1, cnt);
			
			rs = ps.executeQuery();
			
			while (rs.next()) {
				BBoard bBoard = new BBoard();
				
				bBoard.setIdx(rs.getInt("idx"));
				bBoard.setTitle(rs.getString("title"));
				bBoard.setReco(rs.getInt("reco"));
				bBoard.setRegDate(rs.getDate("regDate"));
				bBoard.setCommentCnt(rs.getInt("commentcnt"));
				bBoard.setUsernick(rs.getString("usernick"));
				
				list.add(bBoard);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public void deleteCommunityList(String names) {

		conn = DBconn.getConnection();
		
		String sql = "";
		sql += "DELETE FROM Bboard WHERE idx = ?";
		
		PreparedStatement ps =null;
		try {
			ps = conn.prepareStatement(sql);

			ps.setInt(1, Integer.parseInt(names));
			
//			ps.executeQuery();
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


}