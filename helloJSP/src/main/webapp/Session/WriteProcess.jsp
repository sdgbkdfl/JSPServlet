<%@page import="common.JSFunction"%>
<%@page import="dao.BoardDao"%>
<%@page import="dto.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WriteProcess</title>
</head>
<body>
<%@include file="IsLogin.jsp" %>
<%
	//한글깨짐처리
	request.setCharacterEncoding("UTF-8");
	/*
		작성완료
		다시입력 
		목록보기
	*/
	
	//1.폼에 입력값을 받아서 DTO객체 생성
	/*
	폼으로부터 받은 제목, 내용, 사용자 ID를 Board 객체에 설정하는 예시이므로, 
	이후에는 이 board 객체를 사용하여 게시물을 저장하거나 다른 작업을 수행할 수 있음
	*/
	//폼에서 전달된 제목과 내용 가져옴
	String title =	request.getParameter("title");
	String content = request.getParameter("content");
	//사용자가 로그아웃을 하지 않더라도
	//일정시간 지나면 세션 제거되므로 오류 발생할 수 있음
	//세션에서 userId 속성 값을 가져와서 문자열로 변환
	String id = session.getAttribute("userId").toString();
	//테스트
	//String id = session.getAttribute("userId") == null ? "" : session.getAttribute("userId").toString();
	
	
	//Board객체를 생성하고 set메서드를 사용하여 입력값 설정
	//board는 폼에서 받은 값을 저장할 DTO 객체
	Board board = new Board();
	board.setTitle(title);
	board.setContent(content);
	board.setId(id);
	
	
	//2.DAO.insert(...)호출 :DB에 게시글을 등록하고 결과를 숫자로 반환
	BoardDao dao = new BoardDao();
	int res = dao.insert(board);
	//out.print(res);
	
	
	//3.등록성공 : 리스트 페이지로 이동, 등록 실패 : 메세지 처리
	if(res> 0){
		//등록 성공
		JSFunction.alertLocation("게시글이 등록되었습니다.(공통 호출)", "makeBoard.jsp", out);
		/*
		<script>
			alert("게시글이 등록되었습니다.");
			location.href="makeBoard.jsp";
		</script>
		*/
		}else{
		//등록 실패
		JSFunction.alertBack("등록 중 오류가 발생 하였습니다.(공통호출)", out);
		/*
		<script>
			alert("등록 중 오류가 발생하였습니다.");
			history.go(-1);
		</script>
		*/
	}
%>
</body>
</html>