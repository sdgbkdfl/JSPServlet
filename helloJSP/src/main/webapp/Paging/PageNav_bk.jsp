<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="dto.Criteria"%>
<%@page import="dto.PageDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Page Nav Test</title>
</head>
<body>

<!-- 영역에 저장 -->
	<c:set var="pageDto" value="${pageDto}"/>
	<!-- prev, next : field의 값 -->
<!-- 이전버튼 -->
	<c:if test="${pageDto.prev }">
		<!-- 링크를 버튼으로 0623 수정 -->
		<input type='button' value='이전' onclick='go(${pageDto.startNo-1 })'>
	</c:if>
	
	<!-- 페이지번호 출력 -->
	<c:forEach begin="${pageDto.startNo }" end="${pageDto.endNo }" var="i">
		<a href='List.jsp?pageNo=${i }'>${i }</a>
	</c:forEach>
	
	<!-- 다음버튼 -->
	<c:if test="${pageDto.next }">
		<a href='List.jsp?pageNo=${pageDto.endNo+1 }'>다음</a>
	</c:if>


<!-- 
	PageDto 객체를 가지고 페이지 블럭을 생성
	- 시작번호
	- 끝 번호
	- 게시물의 끝 페이지 번호
	- 이전 버튼 출력여부
	- 다음 버튼 출력여부
 -->
 
 <%
	 //매개변수는 총 게시물 수, 검색 조건(페이지 번호, 페이지 당 게시물 수, 검색어, 검색 조건)
	 /* list파일에서 include 시 충돌나기 때문에 주석 처리함
	 int pageNo = request.getParameter("pageNo")==null
	 	?1: Integer.parseInt(request.getParameter("pageNo"));
 
 	//totalCnt. pageNo를 세팅해주어야함
	 int totalCnt = 300;
	 Criteria criteria = new Criteria(11); //2페이지
	 
	 PageDto pageDto = new PageDto(totalCnt, criteria);
	 */

	 //if(pageDto.isPrev()){
		 //시작페이지 번호가 1보다 큰 경우 이전 버튼을 출력
	 	//out.print("<a href='List.jsp?pageNo="+(pageDto.getStartNo()-1)+"'>");
	 	//out.print("Prev");
	 	//out.print("</a>");
	//}
	 
	 //for(int i = pageDto.getStartNo(); i<= pageDto.getEndNo(); i++){
		// out.print("<a href='List.jsp?pageNo="+i+"'>");
		 //out.print(i);
	 	//out.print("</a>");
	 //}
	 //if(pageDto.isNext()){
		 ////페이지 끝번호가 게시물의 끝페이지 번호와 일치하지 않으면 출력
	 	//out.print("<a href='List.jsp?pageNo="+(pageDto.getEndNo()+1)+"'>");
	 	//out.print("Next");
	 	//out.print("</a>");
	 //}
 
 %>

</body>
</html>