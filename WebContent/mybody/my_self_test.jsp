<%@ page contentType="text/html; charset=utf-8" %>
<% String Path = request.getContextPath();%>
<%@ page import="conn.*, bean.TestDoneBean, java.sql.*, java.util.*" %>
<%
String idid = (String) session.getAttribute("idKey");
   if(idid == null){
%>
      <script type="text/javascript">
         alert("로그인을 해주세요");
         location.href="../home/index.jsp";
      </script>
<%
   }
   
	//DB Connection
	request.setCharacterEncoding("UTF-8");
	TestDoneMgr testDonePool = new TestDoneMgr();
	TestDoneBean testDoneBean = new TestDoneBean();
	MemberPool mp = new MemberPool();
	
	//request 받기 (get방식 parameter)
	int mem_no = 0;
	Vector testDoneList = null;
	if(session.getAttribute("idKey")!=null) {
		mem_no = mp.getMem_noById(session.getAttribute("idKey").toString());//현재 세션의 mem_no 속성의 값		
		String test_no = request.getParameter("test_no");
		String result = request.getParameter("result");

		//query 실행 메소드
		testDoneList = testDonePool.getTestDoneList(mem_no);
	}
		
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
		<h1>나의 SELF-TEST</h1>
		
		<table class="table" name="mytest">
		<tr>
			<td width="30px" align="center">번호</td>
			<td width="100px" align="center">테스트명</td>
			<td width="150px" align="center">테스트한 날짜/시간</td>
			<td width="70px" align="center">테스트 결과</td>
		</tr>

<!-- 해당 멤버의 테스트 결과 조회 -->
<%	
		if (session.getAttribute("idKey")!=null) {
			for(int i=0;i<testDoneList.size();i++){
				testDoneBean = (TestDoneBean)testDoneList.get(i);		
%>
		<tr>
		<!-- 테스트 이름을 클릭하면 해당 테스트로 이동 -->
			<td align="center"><%= i+1 %></td>
			<td align="center"><a href="../selftest/selftest.jsp?test_no=<%= testDoneBean.getTest_no()%>">
				<%= testDoneBean.getTest_name() %>
			</a></td>			
			<td align="center"><%= testDoneBean.getTimestamp() %></td>
			<td align="center">
				<progress value="<%= testDoneBean.getResult()%>" max="<%= testDoneBean.getCount_max() %>">
				</progress>
				<strong><%= testDoneBean.getResult() %> / <%= testDoneBean.getCount_max() %></strong>
			</td>			
		</tr>
<%
			} //for(testDoneList)
		} else {
			//
		}
%>
	</table>
	</section>
	<div class="clear"></div>
	<footer>
		<%@ include file="../base/foot.jsp" %>
	</footer>
</div>
</body>
</html>