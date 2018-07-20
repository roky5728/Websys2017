<%@ page contentType="text/html; charset=utf-8"%>
<% String Path = request.getContextPath();%>
<html>
<head> 
<%@ page import="bean.BoardBean"%>
<% 
	  int num = Integer.parseInt(request.getParameter("num"));
	  String nowPage = request.getParameter("nowPage");
	  BoardBean bean = (BoardBean)session.getAttribute("bean");
	  String subject = bean.getSubject();
	  String name = bean.getName(); 
	  String content = bean.getContent(); 
%>
<title>자유롭게 글을 작성하세요!</title>
<link href="../style.css" rel="stylesheet" type="text/css">
<script>
	function check() {
	   if (document.updateFrm.pass.value == "") {
		 alert("수정을 위해 패스워드를 입력하세요.");
		 document.updateFrm.pass.focus();
		 return false;
		 }
	   document.updateFrm.submit();
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
	
	<nav style="width:10%"></nav>
	<section id="sub_section" style="width:90%;">
		<h1>자유게시판</h1>
		<br/><br/>
		<table width="460" cellspacing="0" cellpadding="3">
		  <tr>
		   <td bgcolor="#FF9018"  height="21" align="center">수정하기</td>
		  </tr>
		</table>
		<form name="updateFrm" method="post" action="updateProc.jsp" >
		<table width="70%" cellspacing="0" cellpadding="7">
		 <tr>
		  <td align="center">
		   <table border="0">
		    <tr>
		     <td width="20%">성 명</td>
		     <td width="80%">
			  <input type="text" name="name" value="<%=name%>" size="30" maxlength="20">
			 </td>
			</tr>
			<tr>
		     <td width="20%">제 목</td>
		     <td width="80%">
			  <input type="text" name="subject" size="50" value="<%=subject%>" maxlength="50">
			 </td>
		    <tr>
		     <td width="20%">내 용</td>
		     <td width="80%">
			  <textarea name="content" rows="10" cols="50"><%=content%></textarea>
			 </td>
		    </tr>
			<tr>
		     <td width="20%">비밀 번호</td> 
		     <td width="80%"><input type="password" name="pass" size="15" maxlength="15">
		      수정시에는 비밀번호가 필요합니다.</td>
		    </tr>
			<tr>
		     <td colspan="2" height="5"><hr/></td>
		    </tr>
			<tr>
		     <td colspan="2">
			  <input type="button" value="수정완료" onClick="check()">
		      <input type="reset" value="다시수정"> 
		      <input type="button" value="뒤로" onClick="history.go(-1)">
			 </td>
		    </tr> 
		   </table>
		  </td>
		 </tr>
		</table>
		 <input type="hidden" name="nowPage" value="<%=nowPage %>">
		 <input type='hidden' name="num" value="<%=num%>">
		</form> 
	</section>

	<div class="clear"></div>
	
	<footer>
		<%@ include file="../base/foot.jsp" %>
	</footer>
</div>
</body>
</html>