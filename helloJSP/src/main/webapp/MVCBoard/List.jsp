<%@page import="java.net.URLDecoder"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MVC Model2 Board</title>
</head>

<body>
	<h2>파일 첨부형 게시판 - 목록보기(List)</h2>
	<!-- <a href="/ListController.do">게시판 목록 바로가기</a> -->
	<!--  -->
	<h5>총 게시물 수 : ${totalcount}</h5>
	<!-- 검색 폼 -->
	<form method ="get" name="searchForm">
	<table width="90%" border="1">
	
	<!-- 페이지번호 -->
	<input type="hidden" name="pageNo">
	
		<tr align="center">
			<td>
				<select name="searchField" style="width:10%; display:inline-block;">
					<option value="title" ${param.searchField eq "title"? "selected" : ""}>제목</option>
					<option value="content" ${param.searchField eq "content"? "selected" : ""}>내용</option>
				</select>
				<input type="text" name="searchWord" value="${param.searchWord}" style="width:30%; display:inline-block;"/>
				<input type="submit" value="검색하기" style="width:10%; display:inline-block;"/>
			</td>
		</tr>
	</table>	
	</form>
	
	
	<!-- 목록테이블 -->
	<table border="1" width="90%">
		<tr class= "bg-color2">
			<th width="10%">번호</th>
			<th width="15%">작성자</th>
			<th width="*%">제목</th>
			<th width="10%">조회수</th>
			<th width="15%">작성일</th>
			<th width="8%">첨부파일</th>
		</tr>
		
	<!-- 리스트가 비어있는지 확인 -->
	<c:choose>
		<c:when test="${empty list }">
			<tr>
				<td colspan="6" align="center">등록된 게시물이 없습니다.</td>
			</tr>
		</c:when>
			<c:otherwise> <!-- 게시물이있을때 -->
				<c:forEach items="${list }" var= "row" varStatus="Loop">
				<tr align="center">
					<td>${row.idx }</td>
					<td>${row.name }</td>
					<td><a href="../mvcboard/view.do?idx=${row.idx}">${row.title }</a></td>
					<td>${row.visitcount }</td>
					<td>${row.postdate }</td>
					<td>
					<!-- 첨부파일 있으면 다운로드 -->
					<c:if test="${not empty row.ofile}">
						<a href="../mvcboard/download.do?ofile=${row.ofile}&sfile=${row.sfile}">
						[다운로드]</a>
					</c:if>
					</td>
				</tr>	
				</c:forEach>
			</c:otherwise>
	</c:choose>
	</table>
		
	<!-- 하단메뉴(바로가기, 글쓰기) -->	
	<table width="90%" border="1">
		<tr align="center">
	 		<td><%@include file="../Paging/PageNavi.jsp" %> </td> 
		</tr>	
			<tr colspan="6">
			<td align="right"><button type="button"  onclick="location.href='../mvcboard/write.do';"> 글쓰기 </button> </td>
			</tr>
	</table>
	
</body>
</html>