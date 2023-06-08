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
		//name속성의 값을 매개값으로 넘겨주면 value속성의 값을 반환
		String id = request.getParameter("userid");
		String pw = request.getParameter("userpw");
		
		if("login".equalsIgnoreCase(id) && "1234".equals(pw)){
			//로그인 성공
			out.print("로그인 성공");
			response.sendRedirect("gogreen.jsp?name="+id);
		%>
			// html출력
			<h1>로그인 성공</h1>	
	<% 	
		}else{
			//로그인 실패
			out.print("로그인 실패");
			response.sendRedirect("gogreen.jsp?loginErr=y");
		}
	%>
</body>
</html>


