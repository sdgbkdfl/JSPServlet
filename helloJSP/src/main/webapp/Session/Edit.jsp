<%@page import="dto.Board"%>
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
<%@include file="Link.jsp" %>
<% 
	//request.getParameter("num") :조회하고자하는 게시글 번호
	String num = request.getParameter("num");
	BoardDao dao = new BoardDao();

	//게시글 한 건을 조회 후 board객체에 담아 반환
	Board board = dao.selectOne(num);
%>	
<h2>수정하기</h2>
<form action="EditProcess.jsp" method="post">
	<input type = "text" value="<%=num %>" name="num">
	<table border="1" width="90%">
			<tr>
				<th>번호</th>
				<td>
				<input type="text" name="title" style="width: 90%;" value="<%= board.getNum() %>">
	
				</td>	
				<th>작성자</th>	
				<td>
					<%= board.getId() %>
				</td>		
			</tr>
			<tr>
				<th>작성일</th>
				<td>
					<%= board.getPostdate()%>
				</td>	
				<th>조회수</th>	
				<td>
					<%= board.getVisitcount() %>
				</td>		
			</tr>
			<tr>
				<th>제목</th>
				<td colspan="3">			
					<input type="text" name="title" style="width: 90%;" value="<%=board.getTitle()%>"/>
				</td>	
		
			</tr>
			<tr>
				<th>내용</th>
				<td colspan="3" height="100">				 
					 <textarea name="content" style="width: 90%; height: 100px;"><%=board.getContent().replace("\r\n", "<br>")%></textarea>
				</td>	
		
			</tr>
			<tr >
				<td colspan="4" align = "center">
					<%
			         	//본인이 작성한 아이디일 경우 수정, 삭제 버튼 활성화 
						//if(session.getAttribute("userId") != null && board.getId().equals(session.getAttribute("userId")) ){         
			         
					 %>
			         <button type="submit">수정완료</button>
			         <button type="reset">초기화</button>
			         <button type="button" onclick="location.href='makeBoard.jsp'">목록보기</button>			    
			         <!--   onclick="location.href='makeBoard.jsp'"-->      	
						
				</td>	
			</tr>
	</table>
</form>
</body>
</html>