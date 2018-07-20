<%@ page contentType="text/html; charset=utf-8"%>
<%@page import="bean.BoardBean"%>
<jsp:useBean id="bMgr" class="conn.BoardMgr" />
<%
	request.setCharacterEncoding("utf-8");
	String nowPage = request.getParameter("nowPage");
	int num = Integer.parseInt(request.getParameter("num"));
	
	//관리자 로그인시 곧바로 삭제
	boolean isadmin = session.getAttribute("idKey").toString().equals("admin");
	if(isadmin) {
		bMgr.deleteBoard(num);
		response.sendRedirect("forum.jsp?nowPage="+nowPage);
	}
	
	//관리자가 아니면 비밀번호 확인 후 삭제 	
	if (request.getParameter("pass") != null) {
		//비번을 입력을 해서 세션에 있는 pass 비교요청
		String inPass = request.getParameter("pass");
		BoardBean bean = (BoardBean) session.getAttribute("bean");
		String dbPass = bean.getPass();
		if (inPass.equals(dbPass)) {
			bMgr.deleteBoard(num);
			String url = "forum.jsp?nowPage=" + nowPage;
			response.sendRedirect(url);
		} else {
%>
<script type="text/javascript">
	alert("입력하신 비밀번호가 아닙니다.");
	history.back();
</script>
<%  	}
	} else {
%>
<title>JSP Board</title>
<link href="../style.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	function check() {
		if (document.delFrm.pass.value == "") {
			alert("패스워드를 입력하세요.");
			document.delFrm.pass.focus();
			return false;
		}
		document.delFrm.submit();
	}
</script>
</head>
<body>
<div id="wrap">
	<header id="sub_header">
		<div id="logo">
			<img id="#" src="../img/img_forum.png" width="140" height="120">	
		</div>
		<%@ include file="../base/top.jsp" %>
	</header>
	<div class="clear"></div>
	
	<nav id="sub_menu">
		<ul>		
			<li><a href="park.jsp">자유게시판</a></li>
		</ul>
	</nav>
	
	<section id="sub_section">
		<h1>자유게시판</h1>
		
				<br/><br/>
		<table width="50%" cellspacing="0" cellpadding="3">
			<tr>
				<td bgcolor=#dddddd height="21" align="center">
					사용자의 비밀번호를 입력해주세요.
				</td>
			</tr>
		</table>
		<form name="delFrm" method="post" action="delete.jsp">
			<table width="70%" cellspacing="0" cellpadding="2">
				<tr>
					<td align="center">
						<table align="center" border="0" width=91%>
							<tr>
								<td align="center">
									<input type="password" name="pass" size="17" maxlength="15">
								</td>
							</tr>
							<tr>
								<td><hr size="1" color="#eeeeee"></td>
							</tr>
							<tr>
								<td align="center">
									<input type="button" value="삭제완료" onClick="check()"> 
									<input type="reset" value="다시쓰기">
									<input type="button" value="뒤로" onClick="history.go(-1)">
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			<input type="hidden" name="nowPage" value="<%=nowPage%>"> 
			<input type="hidden" name="num" value="<%=num%>">
		</form>
	</section>
	<% } %>
	<div class="clear"></div>
	
	<footer>
		<%@ include file="../base/foot.jsp" %>
	</footer>
</div>
</body>
</html>