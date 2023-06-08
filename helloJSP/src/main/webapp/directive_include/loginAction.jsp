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
		
		if("login".equalsIgnoreCase(id) && "1234".equals(pw)){
			//로그인 성공
			response.sendRedirect("gogreen.jsp?name="+id);
			// 아이디를 세션에 저장!
			session.setAttribute("id", id);
		}else{
			//로그인 실패
			response.sendRedirect("gogreen.jsp?loginErr=y");
		}
	%>
	
	
</body>
</html>