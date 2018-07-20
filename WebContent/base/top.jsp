<%@ page contentType="text/html; charset=utf-8" %>
<%@page import="bean.MemberBean"%>
<jsp:useBean id="mMgr" class="conn.MemberMgr" />
<%
	  request.setCharacterEncoding("utf-8");
	  String id = (String) session.getAttribute("idKey");
	  MemberBean mBean = mMgr.getMember(id);
	  String cPath = request.getContextPath();
%>
<nav id="member_management">
	<ul>
	<%
	if(id != null){
	%>
		<li><a href="../member/logout.jsp">로그아웃</a></li>
		<%
		if(id.equals("admin")){
		%>
			<li><a href="../member/admin.jsp" target="_blank">administrator</a></li>
		<%}
		else{ %>
			<li><b><%=id%></b>님 환영합니다!</li>
		<%} %>
	<%} else {%>	
		<li><a href="../member/login.jsp" target="_blank">로그인</a></li>
	<%} %>
	</ul>
</nav>

<nav id="top_menu">
	<ul>
		<li><a href="../home/index.jsp">HOME</a></li>
		<li><a href="../selftest/selftest.jsp">SELF-TEST</a></li>
		<li><a href="../workout/workout.jsp">WORK-OUT</a></li>
		<li><a href="../mybody/my_self_test.jsp">MY몸</a></li>
		<li><a href="../park/park.jsp">주변공원찾기</a></li>
		<li><a href="../forum/forum.jsp">FORUM</a></li>
	</ul>
</nav>