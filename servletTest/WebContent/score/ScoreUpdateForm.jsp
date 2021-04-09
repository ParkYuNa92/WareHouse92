<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보</title>
</head>
<body>
	<h1> 회원 정보 수정 </h1>
	<form action="update" method='post'>
		번호 : <input type='text' name='sno' value='${score.sno}' readonly><br> 
		이름 : <input type='text' name='sname' value='${score.sname}' readonly><br>
		국어 : <input type='text' name='korea' value='${score.korea}'><br>
		수학 : <input type='text' name='math' value='${score.math}'><br>
		영어 : <input type='text' name='eng' value='${score.eng}'><br>
		<input type='submit' value='수정'/>
		<input type='button' value='취소'/>
	</form>
</body>
</html>