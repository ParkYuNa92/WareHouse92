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
	리스트 페이지 입니다.
	<h2> 신규 등록 </h2>
	<a href="insert"> 신규 등록 </a>
	<ul>
		<c:forEach var="a" items="${list}">
			<li> 이름은 ${a.name}, 번호는 ${a.phone}, 주소는 ${a.address}, 가족 수는 ${a.family_number}
		</c:forEach>
	</ul>
</body>
</html>