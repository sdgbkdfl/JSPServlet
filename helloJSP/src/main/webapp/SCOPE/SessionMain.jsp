<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="dto.Person" %>
<%@page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	session.setAttribute("person", new Person("김첨지", 45));
	
	ArrayList<String> lists = new ArrayList<String>();
	
	lists.add("리스트");
	lists.add("컬렉션");
	session.setAttribute("lists", lists);	
%>

<h2>페이지이동된 후 session영역의 속성 읽기</h2>
<a href ="SessionLocation.jsp">SessionLocation.jsp 바로가기</a>
<a href ="SessionInvalidate.jsp">SessionInvalidate.jsp 바로가기</a>
</body>
</html>