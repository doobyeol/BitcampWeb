import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DBConn {
	
	//1. ����ƽ���� ����̹� �ε�
	static {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
		}catch(Exception e) {
			System.out.println("����̺� �ε� ����");
		}
	}
	//DB���� Connection �޼ҵ� �ʿ�. PreparedStatement �ʿ�
			//1�� Connection ����
		Connection conn = null;
			//2�� 
		PreparedStatement pstmt = null;
			//3�� ��� ���
		ResultSet rs = null;
		String sql = null;
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String userid = "c##tester";
		String userpwd = "tester";
	public DBConn() {
		
	}
	//DB����
	public void getConn() {
		try {
			conn = DriverManager.getConnection(url, userid, userpwd);
		}catch(Exception e) {
			System.out.println("dB�� �ڻ쳪�θ���..." + e.getMessage());
		}
		
	}
	//DB���� ����
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
			System.out.println("DB����. �����߻� " + e.getMessage());
		}
	}

}
