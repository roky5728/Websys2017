<%@ page contentType="text/html; charset=utf-8" %>
<% String Path = request.getContextPath();%>
<html>
<head>
<jsp:useBean id="bean" class="bean.BoardBean" scope="session"/>
<%
	  String nowPage = request.getParameter("nowPage");
	  String subject = bean.getSubject();
	  String content = bean.getContent(); 
%>
<title>자유롭게 글을 작성하세요!</title>
<link href="../style.css" rel="stylesheet" type="text/css">
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
	
	<nav style="width:10%"></nav>
	<section id="sub_section" style="width:90%;">
		<h1>댓글</h1>
		<br><br>
		 <table width="460" cellspacing="0" cellpadding="3">
		  <tr>
		   <td bgcolor="#CCCC00" height="21" align="center">답변하기</td>
		  </tr>
		</table>
		<form name="post" method="post" action="replyProc.jsp" >
		<table width="527" cellspacing="0" cellpadding="7">
		 <tr>
		  <td align="center">
		   <table border="0">
		    <tr>
		     <td width="20%">성 명</td>
		     <td width="80%">
			  <input type="text" name="name" size="30" maxlength="20"></td>
		    </tr>
		    <tr>
		     <td width="20%">제 목</td>
		     <td width="80%">
			  <input type="text" name="subject" size="50" value="답변 : <%=subject%>" maxlength="50"></td> 
		    </tr>
			<tr>
		     <td width="20%">내 용</td>
		     <td width="80%">
			  <textarea name="content" rows="12" cols="50">
		      	<%=content %>
		      	========답변 글을 쓰세요.=======
		      	</textarea>
		      </td>
		    </tr>
		    <tr>
		     <td width="20%">비밀 번호</td> 
		     <td width="80%">
			  <input type="password" name="pass" size="15" maxlength="15"></td> 
		    </tr>
		    <tr>
		     <td colspan="2" height="5"><hr/></td>
		    </tr>
			<tr> 
		     <td colspan="2">
			  <input type="submit" value="답변등록" >
		      <input type="reset" value="다시쓰기">
		      <input type="button" value="뒤로" onClick="history.back()"></td>
		    </tr> 
		   </table>
		  </td>
		 </tr>
		</table>
		 <input type="hidden" name="ip" value="<%=request.getRemoteAddr()%>" >
		 <input type="hidden" name="nowPage" value="<%=nowPage%>">
		 <input type="hidden" name="ref" value="<%=bean.getRef()%>">
		 <input type="hidden" name="pos" value="<%=bean.getPos()%>">
		 <input type="hidden" name="depth" value="<%=bean.getDepth()%>">
		</form>
</section>

	<div class="clear"></div>
	
	<footer>
		<%@ include file="../base/foot.jsp" %>
	</footer>
</div>
</body>
</html>