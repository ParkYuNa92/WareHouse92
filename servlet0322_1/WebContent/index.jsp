<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HelloMVC Web Application</title>
</head>
<body>
	여기는 쇼핑 홈페이지입니다.
	<p> <a href="/t?action=logout&green=hong&red=빨강&blue=파랑&black=검정&a1=노랑&a2=흰색&a4=보라&a5=하늘색">로그인 페이지로 이동하세요.</a></p>
	<p> <a href="/t?suc=math">로그인 페이지로 이동하세요.</a></p>
	<form action="t" method="post">
		이름: <input type="text" name="name"/>
		비밀번호: <input type="text" name="pw"/>
		이메일: <input type="text" name="email"/>
		<input type="submit" value="전송"/>
	</form>
</body>
</html>