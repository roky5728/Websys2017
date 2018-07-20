<%@ page contentType="text/html; charset=utf-8" %>
<% String Path = request.getContextPath();%>
<html>
<head>
<title>내 몸, 어디가 어떻게 불편하셨는지 고민해보세요!</title>
<link href="../style.css" rel="stylesheet" type="text/css">
<style>
   .div{
   background-image:url("../img/img02.png");
   
}
.div{
position:relative;
width: 500px;
height:487.0px;
color:blueviolet;
}
.div button{
border:1x solid #ff0080;
border-radius:10px;
background-Color:white;
font:12px 굴림;
font-weight:bold;
color:orange;
}

#botton01{
position:absolute;
left: 401px;
top:30px;
}#botton02{
position:absolute;
left: 401px;
top:60px;
}#botton03{
position:absolute;
left: 401px;
top:90px;
}
#botton11{
position:absolute;
left: 401px;
top:120px;
}

#botton04{
position:absolute;
left: 40px;
top:150px;
}
#botton05{
position:absolute;
left: 40px;
top:180px;
}
#botton06{
position:absolute;
left: 40px;
top:210px;
}

#botton07{
position:absolute;
left: 40px;
top:240px;
}
#botton08{
position:absolute;
left: 40px;
top:270px;
}
#botton09{
position:absolute;
left:350px;
top:250px;
}
#botton10{
position:absolute;
left: 350px;
top:280px;
}

</style>
</head>
<body>
<div id="wrap">
   <header id="sub_header">
      <div id="logo">
         <img id="#" src="../img/img_home.png" width="140" height="120"><!-- 링크없이 사람그림만 메뉴마다변경 -->      
      </div>
      <%@ include file="../base/top.jsp" %>
   </header>
   <div class="clear"></div>
   <section id="sub_section">
      <h1>내 몸, 어디가 어떻게 불편하셨는지 고민해보세요!</h1>
      <div class="div">
		   <button type="button" id="botton01" onclick="location.href='../selftest/selftest.jsp?test_no=2'">안 구  건 조 증</button>
		   <button type="button" id="botton02"  onclick="location.href='../selftest/selftest.jsp?test_no=5'">안면 비대칭</button>
		   <button type="button" id="botton03"  onclick="location.href='../selftest/selftest.jsp?test_no=7'">어깨 결림</button>
		   <button type="button" id="botton11"  onclick="location.href='../selftest/selftest.jsp?test no=1'">목 디스크</button>
		   <button type="button" id="botton04"  onclick="location.href='../selftest/selftest.jsp?test_no=3'">손목터널 증후군</button>
		   <button type="button" id="botton05"  onclick="location.href='../selftest/selftest.jsp?test_no=4'">등  통 증</button>
		   <button type="button" id="botton06"  onclick="location.href='../selftest/selftest.jsp?test_no=6'">골 반  뒤 틀 림</button>
		   <button type="button" id="botton07"  onclick="location.href='../selftest/selftest.jsp?test_no=10'">허리  디스크</button>
		   <button type="button" id="botton08"  onclick="location.href='../selftest/selftest.jsp?test_no=9'">척추측만증</button>
		   <button type="button" id="botton09"  onclick="location.href='../selftest/selftest.jsp?test_no=8'">족저근막염</button>
		   <button type="button" id="botton10"  onclick="location.href='../selftest/selftest.jsp?test_no=11'">휜다리</button>
	   </div>
   </section>

   <div class="clear"></div>
   
   <footer>
      <%@ include file="../base/foot.jsp" %>
   </footer>
</div>
</body>
</html>