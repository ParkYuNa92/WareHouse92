<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.green.vo.Score" %>    
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 목록</title>
</head>
<body>
<jsp:include page="/Header.jsp"/>
	<h1>회원 목록</h1>
	<p><a href='add'>점수 등록</a><br>
	<% 
		ArrayList<Score> scores = (ArrayList<Score>)request.getAttribute("score");
		for(Score i : scores){
			%>
			번호 : <a href='update?sno=<%=i.getSno()%>'><%=i.getSno() %></a>
			이름 : <%=i.getSname() %>
			국어 : <%=i.getKorea() %>
			수학 : <%=i.getMath() %>
			영어 : <%=i.getEng() %>
			총점 : <%=i.getTotal() %>
			평균 : <%=i.getAvg() %><br>
			
		<% }
			%>
			
<jsp:include page="/Tail.jsp"/>
		
</body>
</html>