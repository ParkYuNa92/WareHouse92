<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "basic.vo.Member" %>
<%
	Member member = (Member) session.getAttribute("member");    
%>
<div style="background-color:#00008b; color:#ffffff; text-align:center; height:20px;padding:5px; margin-top:10px">

그린컴퓨터 &copy; 2021

<span style="float:right;">
<%= member.getName() %>
<a style = "color:white;" href="<%= request.getContextPath() %>/auth/logout">로그아웃</a>
</span>
</div>