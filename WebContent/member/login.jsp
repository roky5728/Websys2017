<%@ page contentType="text/html; charset=utf-8"%>
<%
	  request.setCharacterEncoding("utf-8");
	  String id = (String) session.getAttribute("idKey");
%>
<html>
<head>
<title>로그인</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	function loginCheck() {
		if (document.loginFrm.id.value == "") {
			alert("아이디를 입력해 주세요.");
			document.loginFrm.id.focus();
			return;
		}
		if (document.loginFrm.password.value == "") {
			alert("비밀번호를 입력해 주세요.");
			document.loginFrm.password.focus();
			return;
		}
		document.loginFrm.submit();
	}
</script>
</head>
<body bgcolor="#ffffcc">
<br/><br/>
 <div align="center">
		<form name="loginFrm" method="post" action="loginProc.jsp">
			<table>
				<tr>
					<td align="center" colspan="2"><h1>로그인</h1></td>
				</tr>
				<tr>
					<td>아 이 디</td>
					<td><input type="text" name="id" value=""></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="password" value=""></td>
				</tr>
				<tr>
					<td colspan="2">
						<div align="right">
							<input type="button" value="로그인" onclick="loginCheck()">&nbsp;
							<input type="button" value="회원가입" onClick="javascript:location.href='member.jsp'">
						</div>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>