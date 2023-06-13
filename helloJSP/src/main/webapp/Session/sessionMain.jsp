<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Session 설정확인</title>
</head>
<body>
	<!-- Session -->
<%
	//요청시간
	SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss"); //날짜 출력 방식
	
	long creationTime = session.getCreationTime(); ///최초 요청(세션) 시각
	String creationTimeStr = sdf.format(new Date(creationTime));
	
	long lastTime = session.getLastAccessedTime(); //마지막 요청 시각
	String lastTimeStr = sdf.format(new Date(lastTime));
	
	//세션 유지시간 설정(초)
	//session.setMaxInactiveInterval(100);
%>

<h2>Session 설정 확인</h2>
<ul>
	<li>최초 요청 시각 : <%= creationTimeStr%></li>
	<li>마지막 요청 시각 : <%= lastTimeStr%></li>
	<li>세션 아이디 : <%= session.getId() %></li>
	<li>세션 유지 시간 : <%= session.getMaxInactiveInterval()%></li> 
</ul>	
</body>
</html>