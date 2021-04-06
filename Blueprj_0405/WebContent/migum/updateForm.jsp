<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action='update' method='post'>
		번호 <input type="text" name ='no' value='${one.mno}' readonly>
		이름 <input type="text" name ='name' value='${one.name}' >
		점수 <input type="text" name ='total' value='${one.total}'>
		<input type='submit' value='수정'/>
		<input type='reset' value='취소'/>
	</form>
	
</body>
</html>