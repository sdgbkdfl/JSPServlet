<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "java.time.LocalDateTime" %>
<%@page import = "java.time.format.DateTimeFormatter" %>        

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<h1>page지시어의 여러가지 속성들</h1>
	
	<h3>language🐱‍👓</h3>
		<p>페이지에서 사용할 스크립팅 언어를 지정</p>
	
	<h3>contentTypeE 🎈</h3>
		<p>서블릿이나 JSP에서 생성하는 응답의 컨텐츠 타입을 지정하는데 사용<br>
		클라이언트에게 전송되는 컨텐츠의 종류!!<br>
		text/html로 설정된 경우 브라우저는 해당 데이터를 HTML로 해석하여 렌더링</p>
	
	<h3>pageEncoding🎁</h3>
		<p>JSP 페이지의 문자 인코딩을 설정하는 속성</p>
	
	<h3>import🥽</h3>
		<p>java.lang패키지에 속하지 않은 클래스를 JSP문서에서 사용하기 위해 import</p>
	
	<%
		LocalDateTime ldt = LocalDateTime.now();
		String date = ldt.format(DateTimeFormatter.ofPattern("yyy-MM-dd hh:mm:ss"));
	%>
	<%= date%>
</body>
</html>