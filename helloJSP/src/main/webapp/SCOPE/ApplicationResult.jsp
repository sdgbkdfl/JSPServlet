<%@page import="dto.Person"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Application Result</title>
</head>
<body>
	<%
		Map<String, Person> maps
		=(Map<String, Person>)application.getAttribute("maps");
	
		Set<String> keys = maps.keySet();
			
		for(String key : keys){
			Person p = maps.get(key);
			out.print(p.getName()+"/"+p.getAge());
		}
	%>
</body>
</html>