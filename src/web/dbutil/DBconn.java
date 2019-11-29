package web.dbutil;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBconn {
	
	private static final String DRIVER = "oracle.jdbc.driver.OracleDriver";
	private static final String URL = "jdbc:oracle:thin:@localhost:1521:xe";
	private static final String USERNAME = "scott";
	private static final String PASSWORD = "tiger";
	
	// DB 연결 객체
	
	private static Connection conn = null;
	
	// private 생성자
	private DBconn() { }
	
	// Connection 객체 반환 - Singleton Pattern
	public static Connection getConnection() {
		
		if( conn == null ) {
			try {
				Class.forName(DRIVER); // 드라이버 로드
				
				// DB연결객체 생성
				conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
				
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
		return conn; // DB연결객체 반환
	}

}
