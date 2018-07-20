<%@ page contentType="text/html; charset=utf-8" %>
<% String Path = request.getContextPath();%>
<%@ page import="conn.*, bean.TestBean, java.sql.*, java.util.*" %>
<%
	TestBean testBean = new TestBean();
	TestMgr testPool = new TestMgr();
	String test_no=request.getParameter("test_no");
	if(test_no==null) test_no="1";//기본값
	ResultSet rs = null;
	Vector testList=testPool.getTestList(test_no); //query 메소드
	testBean = (TestBean)testList.get(0);
	String videoURL = testBean.getVideoURL();
%>
<html>
<head>
<title>내 몸, 어디가 어떻게 불편하셨는지 고민해보세요!</title>
<link href="../style.css" rel="stylesheet" type="text/css">
</head>
<body>
<div id="wrap">
	<header id="sub_header">
		<div id="logo">
			<img id="#" src="../img/img_workout.png" width="140" height="120">
		</div>
		<%@ include file="../../base/top.jsp" %>
	</header>
	<div class="clear"></div>
	
	<nav id="sub_menu">
		<ul>		
			<li><a href="workout.jsp?test_no=1">목디스크</a></li>
			<li><a href="workout.jsp?test_no=2">안구건조증</a></li>
			<li><a href="workout.jsp?test_no=3">손목터널증후군</a></li>
			<li><a href="workout.jsp?test_no=4">등 통증</a></li>
			<li><a href="workout.jsp?test_no=5">안면비대칭</a></li>
			<li><a href="workout.jsp?test_no=6">골반뒤틀림</a></li>
			<li><a href="workout.jsp?test_no=7">어깨결림</a></li>
			<li><a href="workout.jsp?test_no=8">족저근막염</a></li>
			<li><a href="workout.jsp?test_no=9">척추측만증</a></li>
			<li><a href="workout.jsp?test_no=10">허리디스크</a></li>
			<li><a href="workout.jsp?test_no=11">휜다리</a></li>
		</ul>
	</nav>
	
	<section id="sub_section">
		   <h1><%= testBean.getTest_name()%></h1>
		   <p style="line-height:150%;"><%= testBean.getDescription() %></p>
		   	<iframe width="640" height="480" src="https://www.youtube.com/embed/<%= videoURL %>" frameborder="0"></iframe>
	</section>

	<div class="clear"></div>
	
	<footer>
		<%@ include file="../base/foot.jsp" %>
	</footer>
</div>
</body>
</html>