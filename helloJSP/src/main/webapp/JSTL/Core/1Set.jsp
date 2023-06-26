
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="javax.print.attribute.HashAttributeSet"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.Member"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 
Core 태그 : c

Formatting태그 : fmt

 -->
 <!-- 
 	JSTL 사용 하기 위한 방법
 	1. 태그 라이브러리 추가
 	2.taglib 지시어 추가 
 -->
 	
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <!-- 태그로 작성할 수 있도록 지원 -->
 
 <!-- 
	 1.변수 선언
	 var : 변수명
	 value : 값
	 scope : 저장영역
 -->
 <c:set var="directVar" value="100" />
 <c:set var="elVar" value="${directVar mod 5 }" />
 <c:set var="expVar" value="<%=new Date() %>" />
 <c:set var="betweenVar">변수값 이렇게 설정</c:set>
 
 <h4>El을 이용해 변수 출력</h4>
	 <ul>
		<li>directVar : ${pageScope.directVar }</li> 
		<li>elVar : ${elVar }</li> 
		<li>expVar : ${expVar}</li> 
		<li>betweenVar : ${betweenVar}</li>
	</ul> 
	
<h4>자바빈즈 생성1 - 생성자 사용</h4>
	<c:set var="personVal1" value='<%=new Member("id"," ","하니","2023-06-20") %>' scope="request"/>
	
	<ul>
		<!-- 영역(scope) 지정해주지 않으면 페이지 순서대로 찾아감 -->
		<li>${ personVal1.id }</li>
		<li>${ requestScope.personVal1.name }</li>
	</ul>
	

	
<h3>자바빈즈 생성 후 값 변경하기</h3>
<h4>자바빈즈 생성2 - target, property 사용</h4>
	<c:set var="personVal2" value='<%=new Member("haha"," " ,"하니","2023-06-20") %>' scope="request"/>
	<ul>
		<li>변경 전 이름 : ${ personVal2.name }</li>
		<li>변경 전 아이디: ${ requestScope.personVal2.id }</li>
	</ul>
		
	<c:set target="${personVal2}" property="id" value="hani1234"></c:set>
	<c:set target="${personVal2}" property="name" value="hha1234"></c:set>
	
	<ul>
		<li>변경 후 이름 : ${ personVal2.name }</li>
		<li>변경 후 아이디: ${ requestScope.personVal2.id }</li>
	</ul>
	
<h4>List 컬렉션 이용하기</h4>
<%
	ArrayList<Member> list = new ArrayList<Member>();
	list.add(new Member("haha", "", "하하",""));
	list.add(new Member("hai", "", "하이",""));
%>
<c:set var="plist" value="<%=list %>" scope="request"/>	
	<ul>
		<li>이름 : ${ plist[1].name }</li>
		<li>아이디: ${ requestScope.plist[1].id }</li>
	</ul>
<%
	Map<String, Member> map = new HashMap<String, Member>();
	map.put("pArgs1",new Member("1","","일번",""));
	map.put("pArgs2",new Member("2","","이번",""));
%>
<h4>Map 컬렉션 이용하기</h4>	
	<c:set var="map" value="<%=map %>" scope="request"/>	
	<ul>
		<li>이름 : ${ map.pArgs1.name }</li>
		<li>아이디: ${ requestScope.map.pArgs1.id }</li>
	</ul>
</body>
</html>