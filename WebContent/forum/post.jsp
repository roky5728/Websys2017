<%@ page contentType="text/html; charset=utf-8"%>
<% String Path = request.getContextPath();%>
<%@ page import="conn.*, bean.*, java.sql.*, java.util.*" %>
<html>
<head>
<title>자유롭게 글을 작성하세요!</title>
<link href="../style.css" rel="stylesheet" type="text/css">
</head>
<body>
<div id="wrap">
	<header id="sub_header">
		<div id="logo">
			<img id="#" src="../img/img_forum.png" width="140" height="120"> <!-- 사진수정하기 -->
		</div>
		<%@ include file="../base/top.jsp" %>
	</header>
	<div class="clear"></div>
	

<br/><br/>
<nav style="width:10%"></nav>
<section id="sub_section" style="width:90%;">
	<h1>글쓰기</h1>

	<table cellspacing="0" cellpadding="3">
		<tr>
			<td height="25" align="center">글쓰기</td>
		</tr>
	</table>
	<br/>
	<form name="postFrm" method="post" action="postProc.jsp" enctype="multipart/form-data">
	<table style="display:inline-block; width:60%; ">
		<tr>
			<td align=center>
			<table border="0" width="100%" align="center">
				<tr>
					<td width="10%">성 명</td>
					<td width="90%">
					<input type="text" name="name" size="10" maxlength="8"></td>
				</tr>
				<tr>
					<td width="10%">제 목</td>
					<td width="90%">
					<input type="text" name="subject" size="50" maxlength="30"></td>
				</tr>
				<tr>
					<td width="10%">내 용</td>
					<td width="90%"><textarea name="content" rows="10" cols="50"></textarea></td>
				</tr>
				<tr>
					<td width="10%">비밀 번호</td>
					<td width="90%"><input type="password" name="pass" size="15" maxlength="15"></td>
				</tr>
				<tr>
				 <tr>
	     			<td width="10%">파일찾기</td> 
	     			<td width="90%" ><input type="file" name="filename" size="50" maxlength="50"></td>
	    		</tr>
	 			<tr>
	 				<td>내용타입</td>
	 				<td> HTML<input type=radio name="contentType" value="HTTP" >&nbsp;&nbsp;&nbsp;
	  			 	TEXT<input type=radio name="contentType" value="TEXT" checked>
	  			 	</td>
	 			</tr>
				<tr>
					<td colspan="2"><hr/></td>
				</tr>
				<tr>
					<td colspan="2">
						 <input type="submit" value="등록">
						 <input type="reset" value="다시쓰기">
						 <input type="button" value="리스트" onClick="javascript:location.href='forum.jsp'">
					</td>
				</tr>
			</table>
			</td>
		</tr>
	</table>


<input type="hidden" name="ip" value="<%=request.getRemoteAddr()%>">
</form>
</section>

	<div class="clear"></div>
	
	<footer>
		<%@ include file="../base/foot.jsp" %>
	</footer>
</div>
</body>
</html>