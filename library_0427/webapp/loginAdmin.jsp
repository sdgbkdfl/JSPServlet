<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.library.vo.Member" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Admin</title>
</head>
<body>
<%@include file = "../common/Header.jsp" %>
<%
	if(session.getAttribute("member")!=null){
		Member m =(Member)session.getAttribute("member");
%>
	
<h2>관리자 메뉴</h2>

	
	<%=m.getId() %>님 환영합니다.
	<button onclick="location.href='logout.jsp'">로그아웃</button>
	<%	
}	
	%>
</body>
</html>