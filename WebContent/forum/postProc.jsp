<%@ page contentType="text/html; charset=utf-8"%>
<%//	request.setCharacterEncoding("utf-8");%>
<jsp:useBean id="bMgr" class="conn.BoardMgr"/>
<%
	  bMgr.insertBoard(request);
	  response.sendRedirect("forum.jsp");
%>