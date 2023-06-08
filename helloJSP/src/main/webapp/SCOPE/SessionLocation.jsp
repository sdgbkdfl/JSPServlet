<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="dto.Person" %>
<%@page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>session 영역</title>
</head>
<body>
<h2>페이지 이동 후 session 영역의 속성 읽기</h2>
<!-- 
브라우저를 닫았다가 다시 열면 세션 객체에 저장된 값이 사라지는 것 확인 할 수 있습니다.
 -->
<%
	if(session.getAttribute("person") !=null){
		Person p = (Person)session.getAttribute("person");
		out.println(p.getName()+",");
		out.println(p.getAge());
	}else{
		out.print("session에 저장된 person객체가 없습니다.");
		
	}
	if(session.getAttribute("lists") !=null){
	
	ArrayList<String> lists =(ArrayList<String>)session.getAttribute("lists");
	for(String str : lists)
		out.print(str + "<br/>");
	}
%>

</body>
</html>