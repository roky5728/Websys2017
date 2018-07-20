<%@ page contentType="application;charset=utf-8"%>
<jsp:useBean id="bMgr" class="conn.BoardMgr" />
<%
	  bMgr.downLoad(request, response,out,pageContext);
%>