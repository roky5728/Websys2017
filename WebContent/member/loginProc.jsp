<%@ page contentType="text/html; charset=utf-8"%>
<% String Path = request.getContextPath();%>
<jsp:useBean id="mMgr" class="conn.MemberMgr"/>
<jsp:useBean id="bean" class="bean.MemberBean"/>
<jsp:setProperty  name="bean" property="*"/>

<%
	  request.setCharacterEncoding("utf-8");
	  String id = request.getParameter("id");
	  String password = request.getParameter("password");
	  
	  boolean result = mMgr.loginMember(id, password);
	  if(result){
	    session.setAttribute("idKey",id);
	  }
%>
<script>
	if(<%=result%>){
		location.href="../home/index.jsp";
	}
	else{
		alert("로그인에 실패 하였습니다.");
		location.href="login.jsp";
	}
</script>