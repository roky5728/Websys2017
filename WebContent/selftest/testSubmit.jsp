<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="conn.*, bean.*, java.sql.*, java.util.*" %>
<%  
	//DB Connection
	request.setCharacterEncoding("UTF-8");
	TestDoneMgr testDonePool = new TestDoneMgr();
	int test_no = Integer.parseInt(request.getParameter("test_no"));

	//request 받기 (get방식 parameter)
	if(session.getAttribute("idKey")!=null){
		String id = String.valueOf(session.getAttribute("idKey"));//현재 세션의 mem_no 속성의 값
		int result = Integer.parseInt(request.getParameter("result"));
		MemberPool mp = new MemberPool();
		int mem_no = mp.getMem_noById(id);
		testDonePool.setTestDoneList(test_no, mem_no, result); //query 실행 메소드
	}
	//동영상으로 바로 이동 redirect
	response.sendRedirect("../workout/workout.jsp?test_no="+test_no);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>자가진단 결과 Submit</title>
</head>
<body>

</body>
</html>