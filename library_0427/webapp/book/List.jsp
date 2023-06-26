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
<h2>도서 리스트</h2>
총건수 : 00건
<%@include file="../common/SearchForm.jsp" %>
<table border="1" width="90%">
		<c:if test="${sessionScope.adminYN eq 'Y'}">
		<tr>
			<td colspan="5" class="right">
			<!-- 어드민 계정인 경우 등록,삭제 버튼 출력  -->
			<button>도서등록</button>	
			<button>도서삭제</button>
			</td>
		</tr>
		</c:if>
		<tr class= "bg-color2">
			<th>✔ </th>
			<th width="15%">일련번호</th>
			<th width="*%">도서명</th>
			<th width="15%">대여여부</th>
			<th width="15%">작가</th>
		</tr>
	<!-- 리스트가 비어있는지 확인 -->	
	<c:choose>
		<c:when test="${empty list }">
			<tr>
				<td colspan="5" align="center">등록된 게시물이 없습니다.</td>
			</tr>
		</c:when>
			<c:otherwise>
				<c:forEach items="${list }" var="book" step="1">
			
				<tr align="center">
				<!-- 삭제용 체크박스 -->
					<td><input type="checkbox" name="delNo" value=" ${book.no }"></td>
					<td><a href="../book/view.book?no=${book.title }"></a></td>
					<td>${book.rentyn }</td>
					<td>${book.author }</td>
				</tr>	
				</c:forEach>
			</c:otherwise>
	</c:choose>
	</table>


</body>
</html>