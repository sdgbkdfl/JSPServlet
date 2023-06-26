<%@page import="dto.Board"%>
<%@page import="dao.NewBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../Session/Link.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원제 게시판</title>

</head>
<body>
<%
	//조회하고자 하는 게시글 번호
	String num = request.getParameter("num");
	NewBoardDao dao = new NewBoardDao();
	
	
	//selectOne함수로 가져온 정보를 board객체에 담아야 다른 정보 가져올 수 있음
	//게시글 한 건 조회 후 객체에 담아 반환
	Board board = dao.selectOne("num");
	

%>
<h2>회원제 게시판 - 수정하기(Edit)</h2>
<form action="EditProcess.jsp" method="post">
    <table border="1" width="90%">
        <tr>
            <td>제목</td>
            <td>
                <input type="text" name="title" style="width: 90%;" value="<%=board.getTitle()%>"/> 
            </td>
        </tr>
        <tr>
            <td>내용</td>
            <td>
                <textarea name="content" style="width: 90%; height: 100px;"><%=board.getContent().replace("\r\n", "<br>") %></textarea>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <button type="submit">작성완료</button>
                <button type="reset">초기화</button>
                <button type="button" onclick="location.href='List.jsp'">목록보기</button>
            </td>
        </tr>
    </table>
</form>
</body>
</html>