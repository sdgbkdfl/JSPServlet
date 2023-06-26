<%@page import="common.JSFunction"%>
<%@page import="dao.BoardDao"%>
<%@page import="dao.NewBoardDao"%>
<%@page import="dto.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Process</title>
</head>
<body>
<%@include file="../Session/IsLogin.jsp" %>
<%	
	
	//parameter를 입력받아 Dto객체 생성
	String num = request.getParameter("num");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	String id= session.getAttribute("userId").toString();
	Board board= new Board(num, title, content,"","","");
	
	
	BoardDao dao = new BoardDao(); 
	//NewBoardDao에 함수 만들어 보기!	
	int res = dao.update(board);

	if(res>0){
		//성공: 메세지 출력 후 상세페이지로 이동                               board.getNum()
		JSFunction.alertLocation("게시글이 수정되었습니다.", "view.jsp?num="+num, out);
	}else{
		//실패 메세지 출력 후
		JSFunction.alertBack("수정 중 오류가 발생하였습니다.", out);
	}

%>
</body>
</html>