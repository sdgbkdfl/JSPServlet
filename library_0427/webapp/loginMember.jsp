<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.library.vo.Member" %>
    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Member</title>
</head>
<body>
<%
	if(session.getAttribute("member")!=null){
		Member m =(Member)session.getAttribute("member");
%>
<h1>사용자 메뉴</h1>
	<ul>	
		<li>도서대여</li>
		<li>도서반납</li>	
	</ul>
	
<%=m.getId() %>님 환영합니다.	
<!-- 버튼누르면 페이지 이동... -->
<button onclick="location.href='logout.jsp'">로그아웃</button>
<%	
	}	
%>
</body>
</html>