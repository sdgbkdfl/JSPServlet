<%@page import="dto.Board"%>
<%@page import="java.util.List"%>
<%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	BoardDao dao = new BoardDao();
	List<Board> boardList=dao.getList();
	
	int totalCnt = dao.getTotalCnt();
	
	String searchField = request.getParameter("searchField");
	String search = request.getParameter("search");
	
	//검색어가 null이 아니면 검색 기능을 추가
	out.print(searchField);
	out.print(search);

%>

<jsp:include page="Link.jsp"></jsp:include>
<h2>목록보기(List)</h2>
총건수 : <%= totalCnt %>
<form>
<table border="1" width="700">
	<tr>
	<td align="center">
		<select name="searchField">
			<option value ="title">제목</option>
			<option value ="content">내용</option>
		</select>
		<!--  value="<%--=search--%> : 검색 이후에도 계속 남아있게-->
		<input type="search" name="search" value="<%=search%>">
		<input type="submit" value="검색">
	</td>
	</tr>
</table>

</form>
<table border='1' width="700">
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>작성자</th>
		<th>조회수</th>
		<th>작성일</th>
	</tr>
	
<%
if(boardList.isEmpty()){
	//게시글이 하나도 없을 때
%>
	<tr>
		<td colspan="5" align="center">등록된 게시물이 없습니다.</td>
	</tr>
	
<%
}else{
	for(Board board : boardList){
%>
	<tr>
		<th><%=board.getNum() %></td>
		<td><%=board.getTitle() %> </td>
		<td><%=board.getId() %> </td>
		<td><%=board.getVisitcount() %> </td>
		<td><%=board.getPostdate() %> </td>
	</tr>
<%
	}
}
%>		
</table>

<table border='1' width="700" >
	<tr>
		<td>
		<input type="submit" value="글쓰기">
		</td>
	</tr>
</table>
</body>
</html>