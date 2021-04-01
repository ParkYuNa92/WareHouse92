<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*" %>
<%@ page language="java" import="java.util.*" %>
<%@ page language="java" import="java.text.*" %>

<% request.setCharacterEncoding("utf-8"); %>
	<%	
		String userid= request.getParameter("userid");
		String username= request.getParameter("username");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		String zipcode1 = request.getParameter("zipcode1");
		String zipcode2 = request.getParameter("zipcode2");
		String zipcode = zipcode1+zipcode2;
		String address1 = request.getParameter("address1");
		String address2 = request.getParameter("address2");
		String phone1 = request.getParameter("phone1");
		String phone2 = request.getParameter("phone2");
		String phone3 = request.getParameter("phone3");	
		String phone = phone1 + "-" + phone2+ "-" + phone3;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = new String();
		java.util.Date yymmdd = new java.util.Date();
		SimpleDateFormat myformat = new SimpleDateFormat("yy-MM-d h:mm a");
		String regdate = myformat.format(yymmdd);

		try{
			Class.forName("com.mysql.jdbc.Driver"); 	//mysql driver
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/member",
					"root","1234");	//url, 계정, 비밀번호
			out.println(conn);
		}catch(SQLException e){
			out.println(e);
		}
		boolean bLogin = false;
		
		try{
			query = "insert into member values (?,?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(query);//sql의 커서와 비슷
			pstmt.setString(1, userid);
			pstmt.setString(2, username);
			pstmt.setString(3, password);
			pstmt.setString(4, email);
			pstmt.setString(5, zipcode1+"-"+zipcode2);
			pstmt.setString(6, address1);
			pstmt.setString(7, address2);
			pstmt.setString(8, phone1+"-"+phone2+"-"+phone3);
			pstmt.setString(9, regdate);
			pstmt.executeUpdate();
			//rs.close();
		}catch(SQLException e){	//거의 사용 안 함. mybatis나 jpa 사용
			out.println("<script> alert('가입 처리가 되지 않았습니다. 다시 시도해 주세요.'); history.back();</script>");
		} finally {	//무조건 성공이든 실패든 실행
			conn.close();
		}
		

	%>
	<a href="main.html">main으로 </a>
	&nbsp;[<a href="insert.html">회원등록 페이지로</a>]

<html>
<head>
<title>가입 완료</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- 외부 스타일시트 지정 --%>
<link rel="StyleSheet" href="style.css" type="text/css">
<script language="JavaScript">
<!--
function doSubmit() {
 form = document.join;
 if(!form.userid.value){
  alert('아이디를 입력하지 않았습니다.');
  form.userid.focus();
  return;
  }
 form.submit();
}
//-->
</script>
</head>
<body text="#000000" bgcolor="#FFFFFF">
<br>
<br>
<form name="join" method="post" action="modify.jsp">
<input type=hidden name="userid" value="<%=userid%>">
<input type=hidden name="mode" value="modify">
<table width="500" border="1" bordercolorlight="#999999" bordercolordark="#FFFFFF" cellpadding="3" cellspacing="0" align="center" class="style2">
 <tr align="center"> 
  <td colspan="2" background="image/sky_bar.gif">가입을 축하드립니다. 입력하신 내용을 확인하세요.</td>
 </tr>
 <tr> 
  <td width="15%" align="right">아이디</td>
  <td width="75%"><%=userid%></td>
 </tr>
 <tr> 
  <td width="15%" align="right">이름</td>
  <td width="75%"><%=username%></td>
 </tr>
 <tr> 
  <td width="15%" align="right">비밀번호</td>
  <td width="75%">보안상 기재하지 않습니다.</td>
 </tr>
 <tr> 
  <td width="15%" align="right">EMAIL</td>
  <td width="75%"><%=email%></td>
 </tr>
 <tr> 
  <td width="15%" align="right">우편번호</td>
  <td width="75%"><%=zipcode1+"-"+zipcode2%></td>
 </tr>
 <tr> 
  <td width="15%" align="right">주소1</td>
  <td width="75%"><%=address1%></td>
 </tr>
 <tr> 
  <td width="15%" align="right">주소2</td>
  <td width="75%"><%=address2%></td>    
 </tr>
 <tr> 
  <td width="15%" align="right">휴대폰</td>
  <td width="75%">
  <% 
   if(phone.equals("--")) {
    out.println("<font color='blue'>선택하지 않았습니다.</font>");
	 }else{
	  out.println(phone); 
	 } 
	%>
	</td>
 </tr>
 <tr >
  <td colspan="2" align="center">
   <input type="button" value="확   인" onClick="location='index.htm'">
   <input type="button" value="수   정" onClick="doSubmit()"></td>
 </tr>
</table>
</body>
</html>