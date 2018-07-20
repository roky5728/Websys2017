<%@ page contentType="text/html;charset=utf-8"%>
<%request.setCharacterEncoding("utf-8");%>
<%@page import="bean.MemberBean"%>
<jsp:useBean id="mMgr" class="conn.MemberMgr"/>
<jsp:useBean id="bean" class="bean.MemberBean"/>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.util.*, java.sql.*, conn.MemberPool" %>
<jsp:setProperty  name="bean" property="*"/>

<html>
<head>
<title>관리자 권한</title>
<link href="style.css" rel="stylesheet" type="text/css">

<script type="text/javascript">
</script>
</head>

<body bgcolor="#FFFFCC">
	<div align="center">
	<br>
	<h1>회원 관리</h1>
	<br>
	
<form name="adminForm" method="post" action="../member/memberUpdateProc.jsp">
		<table align="center" border="0" cellspacing="0" cellpadding="5">
				<tr>
					<td align="center" valign="middle" bgcolor="#FFFFCC">
						<table border="1" cellspacing="0" cellpadding="2" align="center" width="700">
<tr>
<td>아이디</td>
<td>이름</td>
<td>성별</td>
<td>생년월일</td>
<td>이메일</td>
</tr>

<%
	MemberPool mbp = new MemberPool();
	MemberBean mb = null;
	Vector memberlist = mbp.getAllMember();
	for (int i=0;i<memberlist.size();i++){
		mb = (MemberBean)memberlist.get(i);
%>
		<tr>
		<td><%=mb.getId()%></td>
		<td><%=mb.getName()%></td>
<%		if(mb.getSex().equals("1")) %>	<td>남</td>
<%		else %><td>여</td>
		<td><%=mb.getBirthday()%></td>
		<td><%=mb.getEmail()%></td>
		</tr>
		<%
	}
	%>
						</table>
					</td>
				</tr>
	</table>
</form>
	
	
	
	</div>
</body>
</html>