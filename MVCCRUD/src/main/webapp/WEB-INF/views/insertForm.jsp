<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	여기 입력하는 폼 잘들어오나 ?
	<form action="insert" method="post">
		이름: <input type="text" name="name"/>
		주소: <input type="text" name="address"/>
		전화번호: <input type="text" name="phone"/>
		가족수 : <input type="text" name="family_number"/>
		<input type="submit" value="등록"/>	
	</form>
</body>
</html>