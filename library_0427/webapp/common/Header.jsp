<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<header>
	userId : ${sessionScope.userId}
	adminYN : ${sessionScope.adminYN}<br>
	<!-- 관리자 --> 
	<c:if test="${sessionScope.adminYN} eq 'Y'" var="res">
		<div>로고</div>
		<div>
			<a href=""> 도서관리</a>
			<a href=""> 회원관리</a>
		</div>
			
		<div>Logout</div>
	</c:if>
		
	<c:if test="${not res }">
		<!-- 로그인 전 사용자 --> 
		<c:if test="${empty sessionScope.userId}" var="res1">
		<div>로그인</div>
		</c:if>
		
		<!-- 일반회원 --> 
		<c:if test="${not res1 }"><br>
				<a href=""> 도서관리시스템</a>
				<a href=""> 마이페이지</a>
				<div>Logout</div>
				</c:if>
	</c:if>
	
</header>
</body>
</html>