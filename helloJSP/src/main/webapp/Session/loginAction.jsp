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
		
		//아이디 저장 체크박스
		String saveYN = request.getParameter("save_check");
		
		out.print("saveYN : "+saveYN+"<br>");

		
		if(saveYN != null && saveYN.equals("Y")){
			
			cookieManager.makeCookie(response,"userid",id,60*60);
		}
		
		/*
			MemberDao.login() :
			아이디 비밀번호가 일치하는 member있으면 Member객체를 반환하고 
			없으면 null 반환	
		*/
		
		
		
		
		
		
		
		//id, password 조회
		if("login".equalsIgnoreCase(id) && "1234".equals(pw)){
			//로그인 성공
			//아이디를 세션에 저장!
			session.setAttribute("id", id);
			//response.sendRedirect("gogreen.jsp?name="+id);
			response.sendRedirect("login.jsp");
		}else{
			//로그인 실패
			response.sendRedirect("login.jsp?loginErr=y");
		}
	%>
	
	
</body>
</html>