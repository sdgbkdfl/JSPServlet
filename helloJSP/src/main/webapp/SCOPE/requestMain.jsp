<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="dto.Person" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
request.setAttribute("requestString","request 영역의 문자열");
request.setAttribute("requestPerson", new Person("김첨지", 45));
%>
<h2>request 영역의 속성값 읽어오기</h2>
<%
	String str =(String)request.getAttribute("request_str");
	Person person =(Person)request.getAttribute("request_person");
%>
<ul>
	<li><%=str %></li>
	<li><%=person.getName() %></li>, <li><%=person.getAge() %></li>
</ul>

<h2>request 영역의 속성 값 삭제하기</h2>
<%
	request.removeAttribute("request_str");
	request.removeAttribute("request_person");
%>

<h2>포워드된 페이지에서 request 영역 속성값 읽기</h2>

request.getRequestDispatcher(
			"RequestForward.jsp?paramHan=한글&paramEng=English")
			.forward(request, response);

 
</body>
</html>