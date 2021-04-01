<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="info" scope="request" class="basic.User"/>
    	현재값:
    <jsp:getProperty name="info" property="name"/>
    <jsp:getProperty name="info" property="num"/><br>
    Form으로부터 설정된 값:
    <jsp:setProperty name="info" property="name"/>
    <jsp:setProperty name="info" property="num" param="id"/>
    <jsp:getProperty name="info" property="name"/>
    <jsp:getProperty name="info" property="num"/><br>
        직접 설정한 값:
    <jsp:setProperty name="info" property="name" value="모짜르트"/>
    <jsp:setProperty name="info" property="num" value="123456"/>
    <jsp:getProperty name="info" property="name"/>
    <jsp:getProperty name="info" property="num"/><br>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>