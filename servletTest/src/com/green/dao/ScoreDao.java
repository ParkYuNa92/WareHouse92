package com.green.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.green.util.DBConnectionPool;
import com.green.vo.Score;

public class ScoreDao {
	DBConnectionPool connPool;
	public void setDBConnectionPool(DBConnectionPool connPool) {
		this.connPool = connPool;
	}
	public ArrayList<Score> selectList() throws Exception {
		Connection connection = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			connection = connPool.getConnection();
			stmt = connection.createStatement();
			rs = stmt.executeQuery("select * from score");
			ArrayList<Score> scores = new ArrayList<Score>();
			while(rs.next()) {
				int korea = rs.getInt("korea");
				int math = rs.getInt("math");
				int eng = rs.getInt("eng");
				int total = korea +math+eng;
				scores.add(new Score().setSno(rs.getInt("sno")).setSname(rs.getString("sname"))
							.setKorea(korea).setMath(math).setEng(eng)
							.setTotal(total)
							.setAvg(total/3.0f));
			}return scores;
		}catch (Exception e) {
			throw e;
		}finally {
			try {if(rs!=null) rs.close();} catch (Exception e) {}	
			try {if(stmt!=null) stmt.close();} catch (Exception e) {}
			if(connection!=null) connPool.returnConnection(connection);
			
		}
	}
	public int insert(Score score) throws Exception{
		Connection connection = null;
		PreparedStatement stmt = null;
		System.out.println("들어오나 "+score.getSpassword());
		try {
			connection = connPool.getConnection();
			stmt = connection.prepareStatement("insert into score(sname,spassword,korea,math,eng,total,avg)"
					+ " values(?,?,?,?,?,?,?)");
			stmt.setString(1, score.getSname());
			stmt.setString(2, score.getSpassword());
			stmt.setInt(3, score.getKorea());
			stmt.setInt(4, score.getMath());
			stmt.setInt(5, score.getEng());
			stmt.setInt(6, score.getKorea()+score.getMath()+score.getEng());
			stmt.setFloat(7, (score.getKorea()+score.getMath()+score.getEng())/3.0f);
			return stmt.executeUpdate();
		}catch(Exception e){throw e;}
		finally {
			try {if(stmt!=null) stmt.close();}catch(Exception e) {}
			if(connection!=null) connPool.returnConnection(connection);
		}
	}
	public int update(Score score) throws Exception{
		Connection connection = null;
		PreparedStatement stmt = null;
		try {
			connection = connPool.getConnection();
			stmt = connection.prepareStatement(
						" update score set korea=?,math=?,eng=? where sno=?");
			stmt.setInt(1, score.getKorea());
			stmt.setInt(2, score.getMath());
			stmt.setInt(3, score.getEng());
			stmt.setInt(4, score.getSno());
			return stmt.executeUpdate();
		}catch (Exception e) {throw e;}
		finally {
			try {if(stmt!=null) stmt.close();}catch(Exception e) {}
			if(connection != null) connPool.returnConnection(connection);
		
		}
	}
	public Score selectOne(int sno) throws Exception{
		Connection connection = null;	
		Statement stmt = null;
		ResultSet rs = null;
		try {
			connection = connPool.getConnection();
			stmt = connection.createStatement();
			rs = stmt.executeQuery("select sno, sname, korea, math, eng from score where sno= "+ sno);
		if(rs.next()) {
			return new Score().setSno(rs.getInt("sno")).setSname(rs.getString("sname"))
					.setKorea(rs.getInt("korea")).setMath(rs.getInt("math"))
					.setEng(rs.getInt("eng"));
		}else {
			throw new Exception();
		}
		}catch(Exception e) {
			throw e;
		}finally {
			try {if(rs!=null) rs.close();}catch(Exception e) {}
			try {if(stmt!=null) stmt.close();}catch(Exception e) {}
			if(connection != null) connPool.returnConnection(connection);
		}
	}

}
