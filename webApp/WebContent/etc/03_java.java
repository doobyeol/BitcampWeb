import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DBConn {
	
	//1. 스태틱으로 드라이버 로딩
	static {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
		}catch(Exception e) {
			System.out.println("드라이브 로딩 에러");
		}
	}
	//DB연결 Connection 메소드 필요. PreparedStatement 필요
			//1차 Connection 연결
		Connection conn = null;
			//2차 
		PreparedStatement pstmt = null;
			//3차 결과 출력
		ResultSet rs = null;
		String sql = null;
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String userid = "c##tester";
		String userpwd = "tester";
	public DBConn() {
		
	}
	//DB연결
	public void getConn() {
		try {
			conn = DriverManager.getConnection(url, userid, userpwd);
		}catch(Exception e) {
			System.out.println("dB가 박살나부린것..." + e.getMessage());
		}
		
	}
	//DB접속 종료
	public void DBClose() {
		try {
			if(rs != null) {
				rs.close();
			}
			if(pstmt!= null) {
				pstmt.close();
			}
			if(conn != null) {
				conn.close();
			}
		}catch(Exception e) {
			System.out.println("DB종료. 에러발생 " + e.getMessage());
		}
	}

}
