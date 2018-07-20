<%@ page contentType="text/html; charset=utf-8" %>
<% String Path = request.getContextPath();%>
<html>
<head>
<title>내 몸, 어디가 어떻게 불편하셨는지 고민해보세요!</title>
<link href="../style.css" rel="stylesheet" type="text/css">
</head>
<body>
<div id="wrap">
	<header id="sub_header">
		<div id="logo">
			<img id="#" src="../img/img_park.png" width="140" height="120">	
		</div>
		<%@ include file="../base/top.jsp" %>
	</header>
	<div class="clear"></div>
	
	<nav id="sub_menu">
		<ul>		
			<li><a href="park.jsp">주변 공원 찾기</a></li>
		</ul>
	</nav>
	
	<section id="sub_section">
		<h1>주변 공원 찾기</h1>
		
		<iframe name="frameTest"  width="600px" height="600px" src="map.html" scrolling="auto" frameborder="0"></iframe>
	</section>

	<div class="clear"></div>
	
	<footer>
		<%@ include file="../base/foot.jsp" %>
	</footer>
</div>
</body>
</html>