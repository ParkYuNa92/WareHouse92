<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<h2> 회원 추가 <a href = 'add'>추가</a></h2>
		<ul>
			번호 이름 총점
			<c:forEach var = "a" items="${u}">
				<li><a href = 'update?no=${a.mno}'>${a.mno}</a>,
				${a.name},${a.total} <a href='delete?no=${a.mno}'>[삭제]</a></li>
				
			</c:forEach>
		</ul>
		
		
</body>
</html>