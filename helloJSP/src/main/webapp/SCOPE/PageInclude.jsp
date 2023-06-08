<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto.Person" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	int pInteger2 =(Integer)(pageContext.getAttribute("pageInteger"));
	//String pString2 = pageContext.getAttribute("pageString").toString();
	Person pPerson2 = (Person)(pageContext.getAttribute("pagePerson"));
%>
	<ul>
		<li>Integer 객체 : <%= pInteger2 %></li>
		<li>String 객체 : <%= pageContext.getAttribute("pageString") %></li>
		<li>Person 객체 : <%= pPerson2.getName() %>,<%=pPerson2.getAge() %></li>		
	</ul>


</body>
</html>