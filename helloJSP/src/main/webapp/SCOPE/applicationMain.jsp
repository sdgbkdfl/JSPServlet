<%@page import="dto.Person"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Application Main</title>
</head>
<body>
<h2>application 영역의 공유</h2>
<%
	Map<String, Person> maps = new HashMap<>();
	
	maps.put("actor1",new Person("전다운", 19));
	maps.put("actor2",new Person("안금자", 13));
	
	application.setAttribute("maps",maps);

%>
</body>
</html>