<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="cnt" scope="application" class="basic.Counter"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		int count=0;
		//request, session, out, response, application 내장객체
		session = request.getSession();
		session.setMaxInactiveInterval(1);
		String first = (String) session.getValue("checkfirst");
		
		if(first != null){
			count = cnt.getCount();
			System.out.println("세션이 없을 때 여기에 들어오나" +count);
		}else {
			cnt.increaseCnt(); // count값을 1씩 증가
			count= cnt.getCount();
			session.putValue("checkfirst", "first");
			System.out.println("세션이 있을 때 여기에 들어오나" +count);
		}
		out.println("현재까지 방문자 수 : " + count);
	%>
</body>
</html>