
<%@page import="common.JSFunction"%>
<%@page import="dao.NewBoardDao"%>
<%@page import="dto.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../Session/Link.jsp" %>
<%@include file="../Session/IsLogin.jsp" %> <% //로그인 체크 %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	//1.폼에 입력값을 받아서 DTO객체 생성
	/*
	폼으로부터 받은 제목, 내용, 사용자 ID를 Board 객체에 설정하는 예시이므로, 
	이후에는 이 board 객체를 사용하여 게시물을 저장하거나 다른 작업을 수행할 수 있음
	*/
	//폼에서 전달된 제목과 내용 가져옴
	String title =	request.getParameter("title"); //제목
	String content = request.getParameter("content"); //내용
	
	//사용자가 로그아웃을 하지 않더라도
	//일정시간 지나면 세션 제거되므로 오류 발생할 수 있음
	//세션에서 userId 속성 값을 가져와서 문자열로 변환
	String id = session.getAttribute("userId").toString();

	//Board객체를 생성하고 set메서드를 사용하여 입력값 설정
	Board board = new Board();
	
	//board는 폼에서 받은 값을 저장할 DTO 객체
	board.setTitle(title);
	board.setContent(content);
	//id는 session으로 부터! 
	board.setId(id);
	
	
	//2.DAO.insert(...)호출 :DB에 게시글을 등록하고 결과를 숫자로 반환
	NewBoardDao dao = new NewBoardDao();
	
	//insert함수에서 결과 값 받아옴
	int res = dao.insert(board);
	
	//3.등록성공 : 리스트 페이지로 이동, 등록 실패 : 메세지 처리
		if(res> 0){
			JSFunction.alertLocation("게시글이 등록되었습니다.", "List.jsp", out);
		}else{
			JSFunction.alertBack("등록 중 오류가 발생 하였습니다.", out);
		}
%>
</body>
</html>