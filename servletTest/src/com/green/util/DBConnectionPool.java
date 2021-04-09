package com.green.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;


public class DBConnectionPool {

	String sname;
	String spassword;
	String url;
	ArrayList<Connection> connList = new ArrayList<Connection>();
	
	public DBConnectionPool(String driver, String sname, String spassword,String url) throws Exception {
		this.sname=sname; this.spassword=spassword; this.url=url;
		Class.forName(driver);
	}
	public Connection getConnection() throws SQLException {
		return DriverManager.getConnection(sname,spassword,url);
		
	}
	public void returnConnection(Connection conn) {
		connList.add(conn);
		
	}
	public void closeAll() {
		for(Connection conn: connList) {
			try {
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
	}
	

}
