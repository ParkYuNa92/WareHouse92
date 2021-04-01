<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%
	Object mem_name = session.getAttribute("member_name");
	Object mem_id = session.getAttribute("member_id");
	session.setAttribute("member_id", mem_id);
	if(session.getValue("mimber_id")==null){
%>
<link rel="StyleSheet" href="style.css" type="text/css">
<script language ="javascript">
	function login_check(){
		if(!document.login.userid.value){
			alert("ID를 입력하세요");
			document.login.userid.focus();
			return;
		}
		if(!document.login.password.value){
			alert("패스워드를 입력하세요");
			document.login.password.focus();
			return;
		}
		document.login.submit();
	}
</script>
<style type="text/css">
	.style3 {
		color: #ff0000;
	}
</style>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="login_process.jsp" name="login" method="POST">
		<tr bgcolor="#d9d9d9">
			<td height="90"> 
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td height="15px">
						</td>
					</tr>
					<tr>
						<td colspan="4" height="5px" bgcolor="#ff0000"></td>
					</tr>
					<tr>
						<td colspan="5" height="10px"></td>
					</tr>
					<tr bgcolor="#ffffff">
						<td width='4%'>&nbsp;</td>
						<td width="34%" class="style1" align="center">회원 아이디</td>
						<td width="62%">
							<input type="text" maxlength="16" name="userid" size="10" class="input_style1">
						</td>
					</tr>
					<tr bgcolor="#d9d9d9">
						<td width="4%"></td>
					</tr>
					<tr bgcolor="#ffffff">
						<td width='4%'>&nbsp;</td>
						<td width="34%" class="style1" align="center">비밀번호</td>
						<td width="62%">
							<input type="password" maxlength="12" name="password" size="10" class="input_style1">
						</td>
					</tr>
					<tr>
						<td colspan="4" height="10px"></td>
					</tr>
					<tr>
						<td colspan="4" height="5px" bgcolor="#0000ff"></td>
					</tr>
					<tr>
						<td colspan="4" height="10px"></td>
					</tr>
				</table>
				<table width="133px" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td height="5px"></td>
					</tr>
					<tr>
						<td width="10px">&nbsp;</td>
						<td class="style1" align="center">
							<a href="javascript:login_check()">로그인</a>&nbsp;
							<a href="insert.html" target="_top">회원가입</a>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</form>
	<%} else{ %>
		<link rel="stylesheet" href="style.css" type="text/css">
		<tr>
			<td height="90px" bgcolor="#f5f5f5">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr align="center">
						<td width="4%" class="style2">
							<%= mem_name %> 님 <br> 환영합니다.
						</td>
					</tr>
				</table>
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td height="5px"></td>
					</tr>
					<tr>
						<td align="center">
							<font class="style2">
								<a href="logout.jsp">로그아웃</a>
							</font>
						</td>
						<td width="5px">&nbsp;</td>
					</tr>
					<tr>
						<td align="center">
							<font class="style2">
								<a href="select.jsp" target="mainFrame">개인정보조회</a>
							</font>
						</td>
					</tr>
					<tr>
						<td align="center">
							<font class="style2">
								<a href="admin.jsp" target="mainFrame">전체 목록 보기</a>
							</font>
						</td>
					</tr>
				</table>
			</td>
		</tr>
<%} %>
</body>
</html>