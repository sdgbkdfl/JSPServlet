<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Header</title>
 <link rel="stylesheet" href="../css/book.css">
</head>
<body>

<header>
	userId : ${sessionScope.userId}
	adminYN : ${sessionScope.adminYN}<br>
		<div>로고</div>
		<div>
			<a href=""> 도서관리시스템</a>
			<a href=""> 마이페이지</a>
		</div>		

		
	<c:if test="${not res }">
		<!-- 로그인 전 사용자 --> 
		<c:if test="${empty sessionScope.userId}" var="res1">
		<a href="../login.jsp">로그인</a>
	</c:if>
		
		<!-- 일반회원 --> 
		<c:if test="${not res1 }"><br>
				<a href=""> 도서관리시스템</a>
				<a href=""> 마이페이지</a>
				</c:if>
	</c:if>
	
</header>
</body>
</html>