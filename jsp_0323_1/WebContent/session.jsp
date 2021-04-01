<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>session 테스트</title>
</head>
<body>
	<%
		session = request.getSession();	//세션 객체 얻음, request 내장객체
		String [] a = session.getValueNames();	//세션에 정의되어 있는 이름을 배열에 저장
		out.println("세션 id : "+session.getId()+"<br>");	//out 내장객체
		out.println("세션 유지 시간 : "+session.getMaxInactiveInterval()+"<br>");
		for(String u :a){
			out.println("배열에 저장된 값은"+u+"<br>");
		}
		if(a.length ==0){
			session.putValue(session.getId(),"A");
		} else {
			String what = (String) session.getValue(a[0]);
			out.println("이름 : " +a[0]+" 값 :" +what +"<br>");
			session.putValue(session.getId(),what+"A");
		}
		//생명주기(Life Cycle) application>session>request>page
		//session 로그인되고 로그아웃하기 전까지 살아있음, 또는 시간설졍(timeout 되기전까지)
	%>
	<a href="session.jsp">다시 읽기</a>
</body>
</html>