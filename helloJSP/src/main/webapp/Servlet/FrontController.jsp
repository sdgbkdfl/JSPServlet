<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Front Controller</title>
</head>
<body>
	<h3>하나의 매핑으로 여러 요청 처리하기</h3>
	${resultValue}
	<ul>
		<li>URI : ${uri }</li>
		<li>Request Name : ${commandStr }</li>
	</ul>
	<ul>
		<li><a href="/Servlet/regist.one">Join</a></li>
		<li><a href="/Servlet/login.one">Login</a></li>
		<li><a href="/Servlet/freeboard.one">Free Board</a></li>
	</ul>
</body>
</html>