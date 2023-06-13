<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Logout</title>
</head>
<body>
<%
	//방법1. 회원 인증 정보 삭제
	session.removeAttribute("userId");
	session.removeAttribute("member");

	//방법2. 세션 무효화
	session.invalidate();
	
	//메인페이지 이동
	response.sendRedirect("LoginForm.jsp");
%>
</body>
</html>