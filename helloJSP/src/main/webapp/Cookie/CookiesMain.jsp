<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내가 만든 cookies  </title>
</head>
<body>
	<h1>1.쿠키 설정🍪 </h1>
	<% 
	Cookie cookie = new Cookie("myCookie","내가만든쿠키");
	
	//적용할 경로
	cookie.setPath(request.getContextPath());
	
	//쿠키 유지 시간(초단위)
	cookie.setMaxAge(3600);
	
	//response 객체에 추가
	response.addCookie(cookie);
	%>
</body>
</html>