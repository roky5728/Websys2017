<%@ page contentType="text/html; charset=utf-8" %>

<html>
<head>
<title>내 몸, 어디가 어떻게 불편하셨는지 고민해보세요!</title>
<link href="../style.css" rel="stylesheet" type="text/css">
</head>
<body>
<div id="wrap">
	<header id="sub_header">
		<div id="logo">
			<img id="#" src="../img/img_mybody.png" width="140" height="115">	
		</div>
		<%@ include file="../base/top.jsp" %>
	</header>
	<div class="clear"></div>
	
	<nav id="sub_menu">
		<ul>		
			<li><a href="my_self_test.jsp">나의 SELF-TEST</a></li>
			<li><a href="my_work_out.jsp">나의 WORK-OUT</a></li>
			<li><a href="modify_member_info.jsp">회원 정보 수정</a></li>
		</ul>
	</nav>
	
	<section id="sub_section">
	
	<%
	if(id != null){
	%>	
		<h1>회원 정보 수정</h1>
		<br><br>
			
		<form name="regFrm" method="post" action="../member/memberUpdateProc.jsp">
			<table align="left" border="0" cellspacing="0" cellpadding="5">
				<tr>
					<td align="center" valign="middle" bgcolor="#FFFFFF">
						<table border="1" cellspacing="0" cellpadding="2" align="center" width="600">
							<tr>
								<td width="20%">아이디</td>
								<td width="80%"><input type="text" name="id" size="15" value="<%=id%>" readonly></td>
							</tr>
							<tr>
								<td>패스워드</td>
								<td><input type="password" name="password" size="15" value="<%=mBean.getPassword()%>"></td>
							</tr>
							<tr>
								<td>이름</td>
								<td><input type="text" name="name" size="15" value="<%=mBean.getName()%>"></td>
							</tr>
							<tr>
								<td>성별</td>
								<td>남<input type="radio" name="sex" value="1"
									<%=mBean.getSex().equals("1") ? "checked" : ""%>> 여<input
									type="radio" name="sex" value="2"
									<%=mBean.getSex().equals("2") ? "checked" : ""%>>
								</td>
							</tr>
							<tr>
								<td>생년월일</td>
								<td><input type="text" name="birthday" size="6"	value="<%=mBean.getBirthday()%>"></td>
							</tr>
							<tr>
								<td>Email</td>
								<td><input type="text" name="email" size="30"
									value="<%=mBean.getEmail()%>"></td>
							</tr>
						
							<tr>
								<td colspan="3" align="center">
								<input type="submit" value="수정완료"> &nbsp; &nbsp; 
								<input type="reset" value="다시쓰기"></td> <!-- 다시쓰기를 클릭하면 회원정보를 수정하기 전으로 reset -->
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>
		
	<%} else
		response.sendRedirect("../member/login.jsp");
	%>	
		
		
	</section>

	<div class="clear"></div>
	
	<footer>
		<%@ include file="../base/foot.jsp" %>
	</footer>
</div>
</body>
</html>