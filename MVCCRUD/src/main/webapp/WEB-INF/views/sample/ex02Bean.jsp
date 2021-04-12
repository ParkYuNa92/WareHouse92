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
	여기는 ex02 Bean 페이지 입니다. 
	<ul>
		<c:forEach var="a" items="${m}">
			<li>  이름은 ${a.name} , 나이는 ${a.age }</li>
		</c:forEach>
		
	</ul>
</body>
</html>