<%@ page contentType="text/html; charset=utf-8"%>
<%request.setCharacterEncoding("utf-8");%>
<jsp:useBean id="mMgr" class="conn.MemberMgr"/>
<jsp:useBean id="bean" class="bean.MemberBean"/>
<jsp:setProperty  name="bean" property="*"/>
<%
	  boolean result = mMgr.updateMember(bean);
	  if(result){
%>
<script type="text/javascript">
		alert("회원 정보를 수정 하였습니다.");
		history.back();
</script>
<% }else{%>
<script type="text/javascript">
		alert("회원정보 수정에 실패 하였습니다.");
		history.back();
</script>
<%} %>