<%@ page contentType="text/html; charset=utf-8"%>
<%request.setCharacterEncoding("utf-8");%>
<jsp:useBean id="mMgr" class="conn.MemberMgr"/>
<jsp:useBean id="bean" class="bean.MemberBean"/>
<jsp:setProperty  name="bean" property="*"/>
<%
	  boolean result = mMgr.insertMember(bean);
	  if(result){
%>
<script type="text/javascript">
		alert("회원가입을 하였습니다.");
		self.close();
</script>
<% }else{%>
<script type="text/javascript">
		alert("회원가입에 실패 하였습니다.");
		history.back();
</script>
<%} %>