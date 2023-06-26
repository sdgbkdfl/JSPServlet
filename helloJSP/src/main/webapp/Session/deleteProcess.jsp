<%@page import="common.JSFunction"%>
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
	//한글깨짐처리
	request.setCharacterEncoding("UTF-8");

	String num = request.getParameter("num");
	out.print(num);

	
	//게시물 삭제
	BoardDao dao = new BoardDao();
	int res = dao.deletePost(num);
	
	if(res>0){
		//성공: 메세지 출력 후 리스트로 이동
		JSFunction.alertLocation("게시글이 삭제되었습니다.(공통 호출)", "makeBoard.jsp", out);
	}else{
		//삭제 실패
		JSFunction.alertBack("삭제 중 오류가 발생하였습니다.(공통호출)", out);
	}
	

%>
</body>
</html>