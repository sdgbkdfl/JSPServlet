<%@page import="dao.MemberDao"%>
<%@page import="dto.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Process</title>
</head>
<body>
<%
	String id = request.getParameter("user_id");
	String pw = request.getParameter("user_pw");
	
	//객체 생성
	MemberDao dao = new MemberDao();
	Member member = dao.login(id,pw);
//out.print(member);
	if(member !=null){
		//로그인 성공
		//→ 세션에 멤버 객체 저장
		session.setAttribute("userId", member.getId());
		session.setAttribute("member", member);
		
		//response.sendRedirect("LoginForm.jsp");
		//페이지 전환하지 않고 보여주기 위해 주석처리
		
	}else{
		//로그인 실패
		//→ 로그인폼 페이지로 이동, 오류메시지 출력
		request.setAttribute("LoginErrMsg", "아이디와 비밀번호가 일치하지 않습니다.");
		
		//LoginForm.jsp로 이동
		//request영역을 공유하기 위해 forward 사용
		//request.getRequestDispatcher("LoginForm.jsp").forward(request, response);
		//리퀘스트에 샌드리다이렉트 받아주면 세션 안되서? 포워딩 헤줘야함 먼말이지
						
				
	}
%>

</body>
</html>