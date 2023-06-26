<%@page import="common.JSFunction"%>
<%@page import="dao.BoardDao"%>
<%@page import="dto.Board"%>
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
	//한글깨짐처리
	request.setCharacterEncoding("UTF-8");

	//parameter를 입력받아 Dto객체 생성
	String num = request.getParameter("num");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	Board board= new Board(num, title, content,"","","");
	
	//게시물 업데이트
	BoardDao dao = new BoardDao();
	int res = dao.update(board);

	
	if(res>0){
		//성공: 메세지 출력 후 상세페이지로 이동
		JSFunction.alertLocation("게시글이 수정되었습니다.(공통 호출)", "view.jsp?num="+ board.getNum(), out);
	}else{
		//실패 메세지 출력 후
		JSFunction.alertBack("수정 중 오류가 발생하였습니다.(공통호출)", out);
	}

%>
</body>
</html>