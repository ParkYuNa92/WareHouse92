<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	여기는 t.jsp 파일입니다. 
	<form action="ex02Bean" method="get">
		0번이름 : <input type="text" name="list[0].name">
		0번나이  : <input type="text" name="list[0].age">
		1번이름 : <input type="text" name="list[1].name">
		1번나이  : <input type="text" name="list[1].age">
		2번이름 : <input type="text" name="list[2].name">
		2번나이  : <input type="text" name="list[2].age">
		3번이름 : <input type="text" name="list[3].name">
		3번나이  : <input type="text" name="list[3].age">
		<input type="submit" value="전송">
	</form>
</body>
</html>