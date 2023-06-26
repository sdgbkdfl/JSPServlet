<%@page import="java.net.URLDecoder"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="fileupload.FileDto"%>
<%@page import="java.util.List"%>
<%@page import="fileupload.FileDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>File List</title>
</head>
<body>
<h2>DB에 등록된 파일 목록보기</h2>
<a href="FileUpload.jsp">파일 등록</a>

<%
	//목록 DB작업 
	//FileDto dto = new FileDto();

	
	//리스트 조회
	//List<FileDto> list = dao.getFileList();
	//총건수 : out.print("총건수 : "+ list.size());
	
%>
	<!--  <P>request : ${requestScope.list}</P>-->
	<!-- 자바빈을 표현언어에서 사용하기위해 변수로 선언 -->
		<!-- jstl을 사용한 방법 -->
	<!--  	
	${requestScope.message}
	<c:set var="fileList" value=""/>-->
	
	
	<!-- servlet을 호출해야 리스트가 나옴 -->
	<!-- 
		fileList라는 이름의 변수를 설정
		request 객체에서 list 속성의 값을 가져오는 것
		request 객체의 list 속성 값을 fileList라는 변수에 저장
	-->
	<c:set var="fileList" value="${requestScope.list}"/>
	
	<table border='1' width="90%">
		<tr align= "center">
			<th>No</th>
			<th>작성자</th>
			<th>제목</th>
			<th>카테고리</th>
			<th>원본 파일명</th>
			<th>저장된 파일명</th>
			<th>작성일</th>
			<th> ✔  </th>
		</tr>
	
		<!-- fileList에 저장된 항목들을 순회하면서 
		각 항목을 fileDto라는 변수에 할당하여 반복 작업을 수행 -->
		<c:forEach items="${fileList }" var="fileDto">
			<tr align= "center">
				<td>${fileDto.idx }</td>	
				<td>${fileDto.name }</td>	
				<td>${fileDto.title }</td>	
				<td>${fileDto.cate }</td>	
				<td>${fileDto.ofile }</td>	
				<td>${fileDto.sfile }</td>	
				<td>${fileDto.postdate }</td>			
				<td><a href="Download.jsp?oName=${fileDto.ofile}&sName=${fileDto.sfile}">다운로드</a></td>			
			</tr>
		</c:forEach>		
		
		<!--  
		<tr align= "center">
			<th><%--<%=dto.getIdx() %></th> 
			<th><%=dto.getTitle() %></th> 
			<td><%=dto.getName() %></td>
			<td><%=dto.getCate() %></td>
			<td><%=dto.getOfile() %></td>
			<td><%=dto.getSfile() %></td>
			<td><%=dto.getPostdate() %> --%></td>
			<td><a href="${pageContext.request.contextPath}/Upload/redboy.jpg" download="RedBoy">다운로드</a>
			 </td>
		</tr>-->
		
	</table>		
</body>
</html>