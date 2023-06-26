<%@page import="common.JSFunction"%>
<%@page import="dao.BoardDao"%>
<%@page import="dto.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View</title>
<% 
	BoardDao dao = new BoardDao();
	dao.updateVisitCount(request.getParameter("num"));
	//request.getParameter("num") :조회하고자하는 게시글 번호
	//게시글 한 건을 조회 후 board객체에 담아 반환
	Board board = dao.selectOne(request.getParameter("num"));
	
	
	//board가 null인지 아닌지 판단
	//board == null : 게시글 없음
	if(board == null){
		JSFunction.alertBack("게시글이 존재하지 않습니다.", out);
		/*
		out.print("<script>");	
		out.print("alert('게시글이 존재하지 않습니다.');");	
		out.print("history.go(-1)");	
		out.print("</script>");
		*/
		return;
	}

	/*
	if(board !=null ){
	out.print(board.getId());
	out.print(board.getTitle());
	out.print(board.getContent());
		
	}else{
		out.print("게시글이 존재하지 않습니다.");
		
		return;
	}
	*/
%>	
<script>
	function deletePost(){
		let res = confirm("삭제하시겠습니까?");
		
		if(res){
			location.href="DeleteProcess.jsp?num=<%=board.getNum()%>"
				
		}
	}

</script>

</head>
<body>
<jsp:include page="Link.jsp" />
<h2>회원제 게시판 - 상세보기(view)</h2>

<table border="1" width="90%">
		<tr>
			<th>번호</th>
			<td>
				<%= board.getNum() %>
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
				<%=board.getTitle()%>
			</td>	
	
		</tr>
		<tr>
			<th>내용</th>
			<td colspan="3" height="100">
				 <%= board.getContent().replace("\r\n", "<br/>") %>
			</td>	
	
		</tr>
		<tr >
			<td colspan="4" align = "center">
				<button type="button" onclick="location.href='makeBoard.jsp';"> 목록보기</button>	
		         <%
		         	//본인이 작성한 아이디일 경우 수정, 삭제 버튼 활성화 
					if(session.getAttribute("userId") != null && board.getId().equals(session.getAttribute("userId")) ){         
		         
		         %>
		         <button type="button" onclick="location.href='Edit.jsp?num=<%=board.getNum()%>'">수정하기</button>
		         <button type="button" onclick="deletePost()">삭제하기</button>		          	
		         <% 
					}
		         %>	
			</td>	
		</tr>
</table>

</body>
</html>