<%@page import="util.cookieManager"%>
<%@page import="el.MyELClass"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL메소드 호출</title>
</head>
<body>
<h3>영역에 저장 후 메서드 호출</h3>
<%
	MyELClass myClass = new MyELClass(); //객체 생성
	pageContext.setAttribute("myClass", myClass);
	pageContext.setAttribute("response", response);
%>
	001129-3000000 => ${myClass.getGender("001225-3000000")}<br/>
	001129-4000000 => ${myClass.getGender("001225-2000000")}
	
<h3>정적 메서드 호출</h3>
<!-- 생성하지 않고 호출가능 -->
	${MyELClass.showGugudan(7)}
	
<h3>정적 메서드 호출 - 쿠키 생성 및 출력</h3>
	${cookieManager.makeCookie(response, "ELCookie", "EL", 10) }<br>
	${cookie.ELCookie.value }
	
<h3>메서드 호출</h3>
${"123-123".replace("-","")}

</body>
</html>