<%@page import="dto.Board"%>
<%@page import="java.util.List"%>
<%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board</title>
</head>
<body>
<%	
	String searchField = request.getParameter("searchField");
	String search = request.getParameter("search");
	
	//검색어가 null인 경우 빈문자열로 치환
	
	search = search == null? "" : search;
	/*
	if(search == null){
		search = "";
	}
	*/
	
	//검색어가 null이 아니면 검색 기능을 추가
	//out.print("검색조건 : "+ searchField +"<br>");
	//out.print("검색어 : " + search);

	BoardDao dao = new BoardDao();
	List<Board> boardList=dao.getList(searchField, search);
	

	int totalCnt = dao.getTotalCnt(searchField, search);	
%>

<jsp:include page="Link.jsp"></jsp:include>
<h2>목록보기(List)</h2>
총건수 : <%= totalCnt %>

<!--검색폼 -->
<form>
<table border="1" width="90%">
	<tr>
		<td align="center">
			<select name="searchField">
				<option value ="title">제목</option>
				<option value ="content">내용</option>
			</select>
			<!--  value="<%--=search--%> : 검색 이후에도 계속 남아있게-->
			<input type="text" name="search" value="<%=search%>">
			<input type="submit" value="검색">
		</td>
	</tr>
</table>

</form>
<table border='1' width="90%">
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
	<tr align= "center">
		<th><%=board.getNum() %></td>
		<td><a href="view.jsp?num=<%=board.getNum()%>" ><%=board.getTitle() %></a></td>
		<td><%=board.getId() %> </td>
		<td><%=board.getVisitcount() %> </td>
		<td><%=board.getPostdate() %> </td>
	</tr>
<%
	}
}
%>		
</table>
<%
	//로그인한 사용자만 글쓰기 버튼 활성화
	if(session.getAttribute("userId") != null){
%>
<table border='1' width="90%" >
	<tr>
		<td align="right">	
			<input type="button" value="글쓰기" onclick="location.href='write.jsp'">
		</td>
	</tr>
</table>
		
<%				
	}
%>
</body>
</html>