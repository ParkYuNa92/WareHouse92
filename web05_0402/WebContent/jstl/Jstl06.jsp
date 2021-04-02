<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="basic.vo.Member" %>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL</title>
</head>
<body>
	<p><a href="Jstl05.jsp">이전</a></p> <p><a href="Jstl07.jsp">다음</a></p>
	<h2> c:forEach 태그</h2>
	<h3> 반복문 - 배열</h3>
	<% pageContext.setAttribute("nameList",new String[]{"홍길동","임꺽정","일지매"}); %>	
	<ul>
		<c:forEach var="name" items="${nameList}">
			<li>${name}</li>
		</c:forEach>
	</ul>
	<h3>반복문 - 배열의 시작 인덱스와 종료 인덱스 지정</h3>
	<% pageContext.setAttribute("nameList2",new String[]{"홍길동","임꺽정","일지매"}); %>	
	<ul>
		<c:forEach var="name" items="${nameList2}" begin="2" end="3">
			<li>${name}</li>
		</c:forEach>
	</ul>
	<h3>반복문 - ArrayList 객체 </h3>
	<% 
		ArrayList<String> nameList3 = new ArrayList<String>();
		nameList3.add("홍길동");
		nameList3.add("임꺽정");
		nameList3.add("일지매");
		nameList3.add("주먹대장");
		nameList3.add("똘이장군");
		pageContext.setAttribute("nameList3", nameList3);
	%>	
	<ul>
		<c:forEach var="name" items="${nameList3}">

			<li>${name}</li>
		</c:forEach>
	</ul>
	//Member 객체를 ArrayList로 저장하고 그 결과를 forEach문으로 출력
	<%
		ArrayList<Member> member = new ArrayList<Member>();
		Member a = new Member();
		Member b = new Member();
		Member c = new Member();
		Member d = new Member();
		Member e = new Member();

		a.setName("강아지"); a.setEmail("puppy@zzang.com"); a.setNo(1); a.setPassword("1234"); a.setModifiedDate(new Date());
		b.setName("고양이"); b.setEmail("cat@tower.com"); b.setNo(2); b.setPassword("1234"); b.setModifiedDate(new Date());
		c.setName("홍길동"); c.setEmail("hong@gildong.com"); c.setNo(3); b.setPassword("12334"); c.setModifiedDate(new Date());
		d.setName("홍말자"); d.setEmail("mal@ja.com"); d.setNo(4); d.setPassword("12344"); d.setModifiedDate(new Date());
		e.setName("병아리"); e.setEmail("bbi@ack.com"); e.setNo(5); b.setPassword("12342"); e.setModifiedDate(new Date());

		
		member.add(a);
		member.add(b);
		member.add(c);
		member.add(d);
		member.add(e);
		
		pageContext.setAttribute("Member", member);
	%>
	<ul>
		<c:forEach var="i" items="${Member}">
			<li>
			<strong>이름 : </strong>${i.name},
			<strong>번호 : </strong><a href='/sample?no=${i.no}'>${i.no} </a>,
			<strong>이메일 : </strong>${i.email},
			<strong>비밀번호 : </strong>${i.password},
			<strong>수정일 : </strong>${i.modifiedDate}</li>
		</c:forEach>
	</ul>
	
	<p><a href="Jstl05.jsp">이전</a></p><p><a href = "Jstl07.jsp">다음</a></p>
</body>
</html>