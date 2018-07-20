<%@ page contentType="text/html; charset=utf-8" %>
<% String Path = request.getContextPath();%>
<%@ page import="conn.*, bean.TestDoneBean, java.sql.*, java.util.*" %>
<%  
	//DB Connection
	request.setCharacterEncoding("UTF-8");
	TestDoneMgr testDonePool = new TestDoneMgr();
	TestDoneBean testDoneBean = new TestDoneBean();
	MemberPool mp = new MemberPool();
	
	//request 받기 (get방식 parameter)
	int mem_no = 0;
	Vector testDoneList = null;
	if(session.getAttribute("idKey")!=null){
		mem_no = mp.getMem_noById(session.getAttribute("idKey").toString());
		String test_no = request.getParameter("test_no");
		String result = request.getParameter("result");
		String videoURL = "";
			
		//query 실행 메소드
		testDoneList = testDonePool.getTestDoneList(mem_no);
	}
%>
<html>
<head>
<title>내 몸, 어디가 어떻게 불편하셨는지 고민해보세요!</title>
<link href="../style.css" rel="stylesheet" type="text/css">	
<script type="text/javascript" src="http://code.jquery.com/jquery-2.1.0.min.js" ></script>
<style type="text/css">
div .video_name {
	margin-top: 10px; padding-left:20px; font-size:20px; font-size-adjust:inherit; padding-top:10px; padding-bottom:3px; height: 30px; color:white; background-color: gray; width: 540px;
}
div .video_body {
	width: 560px; background-color: lightgray;
}	
</style>
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
		<h1>나의 WORK_OUT</h1>
	<div class="whole_container">
<% 		
	Vector<TestDoneBean> rmlist = new Vector<TestDoneBean>();
	TestDoneBean temp = new TestDoneBean();
	if (session.getAttribute("idKey")!=null) {		
		for (int i=0;i<testDoneList.size();i++){
			testDoneBean = (TestDoneBean) testDoneList.get(i);
%>
		<div class="video_name" id="video_name_<%= i %>">
			<%= testDoneBean.getTest_name() %>
		</div>
		<div class="video_body" align="center" id="video_body_<%= i %>">
			<iframe style="padding: 5 5 5 5" width="550" height="350" src="https://www.youtube.com/embed/<%= testDoneBean.getVideoURL() %>" frameborder="0"></iframe>
		</div>
<%
		}//for
	} else {
		response.sendRedirect("../member/login.jsp");
	}
%>
	
	</div>			
	</section>
	<div class="clear"></div>
	<footer>
		<%@ include file="../base/foot.jsp" %>
	</footer>
</div>
</body>
</html>