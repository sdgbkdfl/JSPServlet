<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키 설정 직후 쿠키값 확인</title>
</head>
<body>

<!-- 처음 접속시 저장된 쿠키가 없는 경우 빈페이지 출력될 수 있음 -->

<%
	//요청이 왔을 때 request객체 통해 쿠키 꺼내줌
	Cookie[] cookies = request.getCookies();
	if (cookies !=null){
		for(Cookie cookie : cookies){
			String cookieName = cookie.getName();
			String cookieValue = cookie.getValue();
			
			out.print("쿠키명 :"+ cookieName+"<br>"
					+"쿠키값 : "+cookieValue+"<br>");			
		}
	}

%>
</body>
</html>