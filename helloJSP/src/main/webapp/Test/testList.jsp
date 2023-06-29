<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 목록</title>
</head>
<body>
<%@include file="../common/Header.jsp" %>
<div id=pageTitle>사용자 목록</div>
<h5>총 건수 : ${map.totalcount}건</h5>
<%@include file="../common/SearchForm.jsp" %>

<table border="1" width="100%">		
		<tr class= "bg-color2">
			<th>✔ </th>
			<th width="*%">아이디</th>
			<th width="15%">이름</th>
			<th width="15%">관리자 여부</th>
		</tr>
		
	<!-- 리스트가 비어있는지 확인 -->	
	<c:choose>
		<c:when test="${empty map.list }">
			<tr>
				<td colspan="4" align="center">등록된 이용자가 없습니다.</td>
			</tr>
		</c:when>
			<c:otherwise>
				<c:forEach items="${map.list }" var="dto" step="1">	
				<tr align="center">
					<!-- 체크박스 -->
					<td><input type="checkbox" name="delNo" value=" ${dto.no}"></td>
					<td>${dto.id}</td>
					<td>${dto.name}</td>
					<td>${dto.adminyn }</td>
				</tr>	
				</c:forEach>
			</c:otherwise>
	</c:choose>
</table>
	
	<table width="100%" border="1">
		<tr align="center">
	 		<td><%@ include file="../common/PageNavi.jsp" %> </td> 
		</tr>	
	</table>
</body>
</html>