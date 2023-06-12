<%@page import="dao.MemberDao"%>
<%@page import="dto.Member"%>
<%@page import="util.cookieManager"%>
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
		String id = request.getParameter("userid");
		String pw = request.getParameter("userpw");
		
		 MemberDao dao = new MemberDao();
		 Member member = dao.login(id, pw);
	 
		//name속성의 값을 매개값으로 넘겨주면 value속성의 값을 반환
		
		//아이디 저장 체크박스
		String saveYN = request.getParameter("save_check");
		out.print("saveYN : "+saveYN+"<br>");
		
		//아이디 저장하기 체크박스에 체크가 되어있다면
		//쿠키에 아이디 저장
		if("Y".equals(saveYN)){
			
			cookieManager.makeCookie(response,"userid",id,60*60);
			
			out.print("id :"+id+"<br>");
			//쿠키 생성하기(userId, 사용자 아이디)
			Cookie cookie = new Cookie("userid",id);
			
			//유지시간 설정(초단위)
			cookie.setMaxAge(60*60);
			
			//응답객체에 담기
			response.addCookie(cookie);
		}
		
		if(member !=null && !member.getId().equals("")){
			//로그인 성공
			out.print("로그인 성공");
			response.sendRedirect("login.jsp?name="+id);
		%>
			<!--html출력  --> 
			<h1>로그인 성공</h1>	
	<% 	
		}else{
			//로그인 실패
			out.print("로그인 실패");
			//response.sendRedirect("login.jsp?loginErr=Y");
		}
	%>
</body>
</html>


