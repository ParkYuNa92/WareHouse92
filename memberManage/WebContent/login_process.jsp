<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String userid= request.getParameter("userid");
		String password = request.getParameter("password");
		
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String query = new String();
		String name = new String();

		try{
			Class.forName("com.mysql.jdbc.Driver"); 	//mysql driver
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/member",
					"root","1234");	//url, 계정, 비밀번호
			out.println(conn);
			stmt = conn.createStatement();
		}catch(SQLException e){
			out.println(e);
		}
		boolean bLogin = false;
		
		try{
			query = "select * from member where userid='" + userid +"'";
			query = query + " and password = '" +password+"'";
			//green 데이터 베이스에 접속해서 woori 테이블확인 
			rs= stmt.executeQuery(query);//sql의 커서와 비슷
			if(!(rs.next())){
				name= rs.getString("username");
				bLogin = true;
			}else {
				bLogin =false;
				
			}
			rs.close();
		}catch(SQLException e){	//거의 사용 안 함. mybatis나 jpa 사용
			out.println(e);
		} finally {	//무조건 성공이든 실패든 실행
			conn.close();
		}
		if(bLogin){
			session.setAttribute("member_id", userid);
			session.setAttribute("member_name", name);
			response.sendRedirect("left_Frame.jsp");
		}else{
			out.println("<script>alert('아이디와 비밀번호를 확인하세요.');history.back();</script>");
		}

	%>
	<a href="main.html">main으로 </a>
	&nbsp;[<a href="insert.html">회원등록 페이지로</a>]

</body>
</html>