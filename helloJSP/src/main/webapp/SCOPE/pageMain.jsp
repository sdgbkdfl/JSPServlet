<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto.Person" %>    
<%
	// 속성 저장
	//pageContext 객체 통해 page 영역에 속성값 저장
	pageContext.setAttribute("pageinteger", 10000);
	pageContext.setAttribute("pageStirng","페이지 영역의 문자열");
	pageContext.setAttribute ("pagePerson", new Person("김첨지", 45));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<head><title>page영역</title></head>
<body>
	<h2>page영역의 속성값 읽기</h2>
	<%
	//object타입으로 반환되므로 형변환!!★
	int pInteger =(Integer)(pageContext.getAttribute("pageInteger"));
	String pString = pageContext.getAttribute("pageString").toString();
	Person pPerson = (Person)(pageContext.getAttribute("pagePerson"));
	%>
	<ul>
		<li>Integer 객체 : <%= pInteger %></li>
		<li>String 객체 : <%= pString %></li>
		<li>Person 객체 : <%= pPerson.getName() %>, <%=pPerson.getAge() %></li>		
	</ul>
	<h2>include된 파일에서 page영역 읽어오기</h2>
	<%@ include file="PageInclude.jsp" %>
	
	<h2>페이지 이동 후 page 영역 읽어오기</h2>
	<a href="PageLocation.jsp">PageLocation.jsp 바로가기</a>

</body>
</html>