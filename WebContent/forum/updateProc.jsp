<%@ page contentType="text/html; charset=utf-8"%>
<%request.setCharacterEncoding("utf-8");%>
<jsp:useBean id="bMgr" class="conn.BoardMgr" />
<jsp:useBean id="bean" class="bean.BoardBean" scope="session"/>
<jsp:useBean id="upBean" class="bean.BoardBean"/>
<jsp:setProperty property="*" name="upBean"/>
<%
	  String nowPage = request.getParameter("nowPage");
	  //bean에 있는 pass와 upBean pass를 비교(read.jsp)
	  String upPass = upBean.getPass();
	  String inPass = bean.getPass();
	  if(upPass.equals(inPass)){
	    bMgr.updateBoard(upBean);
		String url = "read.jsp?nowPage="+nowPage+"&num="+upBean.getNum();
		response.sendRedirect(url);
	  }else{
%>
	<script type="text/javascript">
		alert("입력하신 비밀번호가 아닙니다.");
		history.back();
	</script>
<%}%>