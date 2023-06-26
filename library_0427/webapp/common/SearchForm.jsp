
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="../common/Header.jsp" %>

<h5>총 게시물 수 : ${totalcount}</h5>
	<!-- 검색 폼 -->

	<form method ="get" name="searchForm">
	<table width="90%" border="1">
	
	<!-- 페이지번호 -->
	<input type="text" name="pageNo">
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
</body>
</html>