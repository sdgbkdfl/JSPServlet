<%@page import="util.cookieManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>하루동안 팝업탕이 열리지 않도록 쿠키생성</title>
</head>
<body>
<h2>쿠키를 활용한 팝업창 제어</h2>

<%
	//하루동안 팝업창이 열리지 않도록 쿠키 생성
	cookieManager.makeCookie(response, "PopupClose", "Y", 60*60*24);

	//웹 서버가 웹 브라우저에게 다른 페이지로 이동하라고 응답하는 기능
	//response.sendRedirect("popupMain.jsp");

%>
</body>
</html>