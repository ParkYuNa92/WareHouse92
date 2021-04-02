<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL</title>
</head>
<body>
	<p><a href="Jstl03.jsp">이전</a></p> <p><a href="Jstl05.jsp">다음</a></p>
	<h2> c:if 태그</h2>
	<c:if test="${10>20}" var="resutl1">
		1) 10은 20보다 크다
	</c:if>
	2)${result1}<br>
	<c:if test="${10<20}" var="resutl2">
		2) 10은 20보다 작다
	</c:if>
	2) ${result2}<br>
	
	<p><a href="Jstl03.jsp">이전</a></p><p><a href = "Jstl05.jsp">다음</a></p>
</body>
</html>