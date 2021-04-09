<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>등록</title>
</head>
<body>
	<jsp:include page="/Header.jsp"/>
	<h1> 등록 </h1>
	<form action='add' method='post'>
		이름:<input type='text' name='sname'><br>
		비밀번호:<input type='password' name='spassword'><br>
		국어:<input type='text' name='korea'><br>
		수학:<input type='text' name='math'><br>
		영어:<input type='text' name='eng'><br>
		<input type='submit' value='추가'/>
		<input type='reset' value='취소'/>
	</form>
	<jsp:include page="/Tail.jsp"/>
</body>
</html>