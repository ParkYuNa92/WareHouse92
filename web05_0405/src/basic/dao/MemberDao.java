package basic.dao;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;

import basic.util.DBConnectionPool;
import basic.vo.Member;

public class MemberDao {
	DBConnectionPool connPool;
	
	public void setDBConnectionPool(DBConnectionPool connPool) {
		this.connPool=connPool;
	}
	public int insert(Member member) throws Exception {
		Connection connection = null;	//추가
		PreparedStatement stmt = null;
		try {
			connection = connPool.getConnection();	//추가
			
			stmt =  connection.prepareStatement(
					"insert into members(email, pwd, mname, cre_date, mod_date)"
					+ " values(?,?,?,now(),now())");
			stmt.setString(1, member.getEmail());
			stmt.setString(2, member.getPassword());
			stmt.setString(3, member.getName());
			return stmt.executeUpdate();	//추가된 데이터의 갯수를 반환

		}catch(Exception e) {throw new ServletException(e);
		}finally {
			try {if(stmt != null) stmt.close();}catch(Exception e) {}
			if(connection != null) connPool.returnConnection(connection); 	//추가
			}

		}

	public ArrayList<Member> selectList() throws Exception{
		Connection connection = null;	//추가
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			connection = connPool.getConnection();	//추가
			stmt= connection.createStatement();
			rs = stmt.executeQuery(
					"select * from members order by mno asc");
			ArrayList<Member> members = new ArrayList<Member>();
	
			//데이터베이스에서 회원 정보를 가져와 Member에 담는다
			//그리고 Member객체를 ArrayList에 추가
			while(rs.next()) {	//배열로 변경
				members.add(new Member()
					.setNo(rs.getInt("mno"))
					.setName(rs.getString("mname"))
					.setEmail(rs.getString("email"))
					.setCreatedDate(rs.getDate("cre_date")));
			}
		return members;
		}catch(Exception e) {
			throw e;
		}finally {
			try {if(rs!=null) rs.close();} catch(Exception e) {};
			try {if(stmt!=null) stmt.close();} catch(Exception e) {};
			if(connection != null) connPool.returnConnection(connection); 	//추가
		}
	}
	
	public int delete (int no) throws Exception{
		Connection connection = null;	//추가
		Statement stmt = null;
		try {
			connection = connPool.getConnection();	//추가
			stmt =  connection.createStatement();
			return stmt.executeUpdate("delete from members where mno= "+ no);
		}catch(Exception e) {throw e;}
		finally {
			try {if(stmt!=null) stmt.close();} catch (Exception e) {}
			if(connection != null) connPool.returnConnection(connection); 	//추가
		}
	}
	public Member selectOne(int no) throws Exception{
		Connection connection = null;	//추가
		Statement stmt = null;
		ResultSet rs = null;
		try {
			connection = connPool.getConnection();	//추가
			stmt = connection.createStatement();
			rs = stmt.executeQuery("select mno, email, mname, cre_Date from members "+ 
					" where mno =" +no);
			if(rs.next()) {
				return new Member().setNo(rs.getInt("mno")).setEmail(rs.getString("email"))
						.setName(rs.getString("mname")).setCreatedDate(rs.getDate("cre_date"));
			}else {
				throw new Exception ("해당 번호를 찾을 수 없습니다.");
			}
		}catch(Exception e) {
				throw e;
			}finally {
				try {if(rs!=null) rs.close();}catch(Exception e) {}
				try {if(stmt!=null) stmt.close();}catch(Exception e) {}
				if(connection != null) connPool.returnConnection(connection); 	//추가
			}
		}
	public int update(Member member) throws Exception{
		Connection connection = null;	//추가
		PreparedStatement stmt= null;
		try {
			connection = connPool.getConnection();	//추가
			stmt = connection.prepareStatement (" update members set email=?, mname=?, mod_date=now()" +
									" where mno=?");
			stmt.setString(1, member.getEmail());
			stmt.setString(2, member.getName());
			stmt.setInt(3, member.getNo());
			return stmt.executeUpdate();
		} catch (Exception e) {
			throw e;
		} finally {
			try {if(stmt!=null) stmt.close();}catch(Exception e) {}
			if(connection != null) connPool.returnConnection(connection); 	//추가
		}
	}
	

	public Member exist(String email, String password) throws Exception{
		Connection connection = null;	//추가
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			connection = connPool.getConnection();	//추가
			stmt = connection.prepareStatement(
					"select mname, email from members where email=? and pwd=? ");
			stmt.setString(1, email);
			stmt.setString(2, password);	
			
			rs = stmt.executeQuery();
			System.out.println("resultSet은 무엇인가"+rs);

			if(rs.next()) {
				return new Member().setEmail(rs.getString("email")).setName(rs.getString("mname"));
			}else {
				return null;
			}
		}catch(Exception e) {
			throw e;
		}finally {
			try {if(rs!=null) rs.close();}catch(Exception e) {}
			try {if(stmt!=null) stmt.close();}catch(Exception e) {}
			if(connection != null) connPool.returnConnection(connection); 	//추가
		}
	}
}
		
			
		
	
	
	
	
		

