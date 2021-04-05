package basic.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;

public class DBConnectionPool {
	String url;
	String username;
	String password;
	ArrayList<Connection> connList = new ArrayList<Connection>();
	
	public DBConnectionPool(String driver, String url, String username,String password) throws Exception{
		this.url=url;
		this.username=username;
		this.password=password;	
		Class.forName(driver);	//추가
	}

	public Connection getConnection() throws SQLException {
		
		return DriverManager.getConnection(url,username,password);
	}

	public void returnConnection(Connection conn) {
		connList.add(conn);
	}

	public void CloseAll() {
		for(Connection conn: connList) {
			try {
				conn.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	
}
