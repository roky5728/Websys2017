<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<%@ page import="conn.*" %>
<%@ page import="bean.TestBean" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%
	request.setCharacterEncoding("utf-8");
	//DB Connection
	TestMgr testPool = new TestMgr();

	//Vector
	Vector testList;
	
	//Parameter: Test_no
	String test_no;
	test_no=request.getParameter("test_no");
	if(test_no==null) test_no="1";
		testList = testPool.getTestList(test_no); //test_no를 넣으면 그 test에 대한 정보가 testList에 저장됨
	TestBean testBean = (TestBean)testList.get(0); 
%>
<html>
<head>
<title>내 몸, 어디가 어떻게 불편하셨는지 고민해보세요!</title>
<link href="../style.css" rel="stylesheet" type="text/css">
<style>
button{
  color:#fff;
  text-align: center;
  padding: 20px;
}

.button-one, .button-two, .button-three{
  text-align: center;
  cursor: pointer;
  font-size:20px;
  margin: 0 0 0 100px;
}



/*Button One*/
.button-one {
  padding:20px 60px;
  outline: none;
  background-color: #27ae60;
  border: none;
  border-radius:5px;
  box-shadow: 0 9px #95a5a6;
}

.button-one:hover{
  background-color: #2ecc71;
}

.button-one:active {
  background-color: #2ecc71;
  box-shadow: 0 5px #95a5a6;
  transform: translateY(4px);
}


/*Button Two*/
.button-two {
  border-radius: 8px;
  background-color: #a3a282;
  border: none;
  padding: 20px;
  width: 300px;
  transition: all 0.5s;
}


.button-two span {
  cursor: pointer;
  display: inline-block;
  position: relative;
  transition: 0.5s;
}

.button-two span:after {
  content: '»';
  position: absolute;
  opacity: 0;
  top: 0;
  right: -20px;
  transition: 0.5s;
}

.button-two:hover span {
  padding-right: 25px;
}

.button-two:hover span:after {
  opacity: 1;
  right: 0;
}


/*Button Three*/
.button-three {
    position: relative;
    background-color: #f39c12;
    border: none;
    padding: 20px;
    width: 200px;
    text-align: center;
    -webkit-transition-duration: 0.4s; /* Safari */
    transition-duration: 0.4s;
    text-decoration: none;
    overflow: hidden;
}

.button-three:hover{
   background:#fff;
   box-shadow:0px 2px 10px 5px #97B1BF;
   color:#000;
}

.button-three:after {
    content: "";
    background: #f1c40f;
    display: block;
    position: absolute;
    padding-top: 300%;
    padding-left: 350%;
    margin-left: -20px !important;
    margin-top: -120%;
    opacity: 0;
    transition: all 0.8s
}

.button-three:active:after {
    padding: 0;
    margin: 0;
    opacity: 1;
    transition: 0s
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-2.1.0.min.js" ></script>
<script type="text/javascript" src="/script.js"></script>
<script type="text/javascript">

//결과보기 버튼을 누르면 결과가 나오는 스크립트
$(function(){
  $('#btn_show').click(function(){
    $('#btn_word').show();
  });
});


//자가진단 체크 개수를 알아내는 스크립트
function checkCount(obj) {
    var sum = 0;
    var count = document.form1.checkbox.length;
    for(var i=0; i < count; i++ ){
        if( document.form1.checkbox[i].checked == true ){
            sum += 1;
        }
    }
    document.getElementById("hidden_result").value=sum; //보낼값
    var result = document.getElementById("result");
    if (sum>obj) result.innerHTML="조심하셔야겠어요!"; else result.innerHTML="아직은 괜찮아요!";
}
</script>
</head>
<body>
<div id="wrap">
	<header id="sub_header">
		<div id="logo">
			<a href="index.jsp"><img id="#" src="../img/img_selftest.png" width="120" height="110"></a>			
		</div>
		<%@ include file="../base/top.jsp" %>
	</header>
	<div class="clear"></div>
	
	<nav id="sub_menu">
		<ul>		
			<li><a href="selftest.jsp?test_no=1">목디스크</a></li>
			<li><a href="selftest.jsp?test_no=2">안구건조증</a></li>
			<li><a href="selftest.jsp?test_no=3">손목터널증후군</a></li>
			<li><a href="selftest.jsp?test_no=4">등 통증</a></li>
			<li><a href="selftest.jsp?test_no=5">안면비대칭</a></li>
			<li><a href="selftest.jsp?test_no=6">골반뒤틀림</a></li>
			<li><a href="selftest.jsp?test_no=7">어깨결림</a></li>
			<li><a href="selftest.jsp?test_no=8">족저근막염</a></li>
			<li><a href="selftest.jsp?test_no=9">척추측만증</a></li>
			<li><a href="selftest.jsp?test_no=10">허리디스크</a></li>
			<li><a href="selftest.jsp?test_no=11">휜다리</a></li>
		</ul>
	</nav>
	
	<section id="sub_section">
	
	
	<% if (Integer.parseInt(test_no)>0){ %>
	<!-- section 시작 -->
			<form name="form1">
				<h1><%= testBean.getTest_name() %></h1><br>
				<br>
				해당되는 증상을 체크하고 결과보기를 눌러 내 상태를 진단해보세요!
				<hr>
				<br>
				<div id="checklist">
				<br>
					<%
						String[] checklist=testBean.getChecklist().split(";"); //체크리스트
						for(int i=0;i<checklist.length;i++){
					%>
					<p>
						<input type="checkbox" name="checkbox" class="checkbox"><%=checklist[i]%><br>
					</p>
					<%
						}
					%>
				</div>
				<br>
			
				<input type="button" class="button-three" id="btn_show" onclick="checkCount(<%= testBean.getCount() %>)" value="결과보기">
			</form>
	<!-- 결과보기를 누르면 나오는 곳 -->
			<form action="testSubmit.jsp" method="get" name="form_test">
				<br><br>
				<div id="btn_word" hidden="hidden">
				
					<h2><span id="result"></span></h2>
					<br><br>
					<p style="background-color: lightgray; padding:20 20 20 20; line-height:150%;"><%= testBean.getDescription() %></p><br>
					<input type="hidden" id="hidden_result" name="result">
					<input type="hidden" name="test_no" value="<%= testBean.getTest_no()%>">
					<div align="right"><button type="submit" class="button-two" value="결과 저장 후 동영상 보러가기"><span>저장&동영상</span></button></div>
				</div>
			</form>
		<!-- section 끝 -->
	<%} %>	
	</section>

	<div class="clear"></div>
	
	<footer>
		<%@ include file="../base/foot.jsp" %>
	</footer>
</body>
</html>