package com.green.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;

import com.green.util.DBConnectionPool;
import com.green.vo.Migum;

import lombok.Setter;

@Setter
public class MigumDao {	//Datebase Access Object/CRUD(create,r??,update,delete)
	DBConnectionPool connPool;
	
	public List<Migum> selectList() throws Exception{	//전체 목록 가져오기
		Connection connection = null;
		Statement stmt= null;
		ResultSet rs = null;
		
		try {	// 데이터베이스는 try,catch문으로 감싼다
			connection = connPool.getConnection();
			stmt = connection.createStatement();
			rs = stmt.executeQuery(
					"select * from migum");
			
//			rs.next();
//			String name = rs.getString("name");
//			int no = rs.getInt("mno");
//			int total = rs.getInt("total");
//			System.out.println("이름 : "+name);
//			System.out.println("번호 : "+no);
//			System.out.println("총점 : "+total);
//			Migum a = new Migum();
//			a.setName(name);
//			a.setMno(no);
//			a.setTotal(total);
//			System.out.println("===================");
//			rs.next();
//			System.out.println("이름 : "+a.getName());
//			System.out.println("번호 : "+a.getMno());
//			System.out.println("총점 : "+a.getTotal());
//			System.out.println("===================");
//			rs.next();
//			name = rs.getString("name");
//			no = rs.getInt("mno");
//			total = rs.getInt("total");
//			Migum b = new Migum().setName(name).setMno(no).setTotal(total);
//			System.out.println("이름b : "+b.getName());
//			System.out.println("번호 : "+b.getMno());
//			System.out.println("총점 : "+b.getTotal());
//			System.out.println("===================");
//			rs.next();
//			name = rs.getString("name");
//			no = rs.getInt("mno");
//			total = rs.getInt("total");
//			Migum c = new Migum();
//			c.setName(name);
//			c.setMno(no);
//			c.setTotal(total);
//			System.out.println("이름 : "+c.getName());
//			System.out.println("번호 : "+c.getMno());
//			System.out.println("총점 : "+c.getTotal());
//			System.out.println("===================");
			
			ArrayList<Migum> migums = new ArrayList<Migum>();
			
			
			while(rs.next()) {
				migums.add(new Migum().setMno(rs.getInt("mno")).setName(rs.getString("name")).setTotal(rs.getInt("total")));
			}
			return migums;
				
		}catch(Exception e) {
		}
		
		return null;
	}
	public Migum get(String no) throws Exception{
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			conn = connPool.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select * from migum where mno= "+ no);
			if(rs.next()) {
				return new Migum().setMno(rs.getInt("mno")).setName(rs.getString("name")).setTotal(rs.getInt("total"));
			}else {
				throw new Exception("해당 번호의 회원을 찾을 수 없습니다.");
			}
		}catch(Exception e) {
			throw e;
		}finally {
			try {if(rs!=null) rs.close();} catch(Exception e) {}
			try {if(stmt!=null) stmt.close();} catch(Exception e) {}
			if(conn!=null) connPool.returnConnection(conn);
		}
		
	}
	public int update(Migum m) throws Exception {
		Connection connection = null;
		PreparedStatement stmt = null;	//물음표로 받을 때는 prepared
		try {
			connection = connPool.getConnection();
			stmt = connection.prepareStatement("update migum set total=?, name=? where mno=? ");
			
			stmt.setInt(1, m.getTotal());
			stmt.setString(2, m.getName());
			stmt.setInt(3, m.getMno());
			return stmt.executeUpdate();
					
		}catch(Exception e) {
			throw e;
		}finally {
			try {if(stmt!=null) stmt.close();}catch(Exception e) {}
			if(connection!=null) connPool.returnConnection(connection);
		}
		
	}
	public int delete(int no) throws Exception{
		System.out.println("다오에서 삭제는 11) ? "+no);
		Connection connection = null;
		Statement stmt = null;
		
		try {
			connection = connPool.getConnection();
			stmt = connection.createStatement();
			System.out.println("다오에서 삭제는 ? 12) "+no);
			return stmt.executeUpdate("delete from migum where mno = " +no);
			
			
		}catch(Exception e) {
			
		}finally {
			try {if(stmt!=null) stmt.close();}catch(Exception e) {}
			if(connection!=null) connPool.returnConnection(connection);
		}
		
		return 0;
	}
	
	public int insert(Migum m) throws Exception {
		Connection connection = null;	//추가
		PreparedStatement stmt = null;
		try {
			connection = connPool.getConnection();	//추가
			
			stmt =  connection.prepareStatement(
					"insert into migum(total, name)"
					+ " values(?,?)");
			stmt.setInt(1, m.getTotal());
			stmt.setString(2, m.getName());
			
			stmt.executeUpdate();	//추가된 데이터의 갯수를 반환

		}catch(Exception e) {throw new ServletException(e);
		}finally {
			try {if(stmt != null) stmt.close();}catch(Exception e) {}
			if(connection != null) connPool.returnConnection(connection); 	//추가
			}
			return 0;
		}
		
	
	
}
