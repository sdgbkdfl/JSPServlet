<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 처리</title>
</head>

<body>
	<%
		String id = request.getParameter("user_id");
		String pw = request.getParameter("user_pwd");
		
		out.print("id:"+id +"<br>");
		out.print("pw:"+pw +"<br>");

		
		//아이디가 login 비번이 1234이면 로그인 성공
		// id != null && id.equals("abc")
		if("login".equals(id) && "1234".equals(pw)){
			//로그인 성공
			out.print("로그인 성공");
			// 요청할 페이지 정보
			response.sendRedirect("responseWelcome.jsp");
		}else{
					
			
			// 로그인 실패
			out.print("로그인 실패");
			//response.sendRedirect("responseMain.jsp?loginErr=y");
			
			//사용자로부터 전달받은  request 객체가 공유되므로 
			//아이디를 바로 출력할 수 있다(redirect시 null출력, 왜?)
			RequestDispatcher rd = request.getRequestDispatcher("responseMain.jsp");
			rd.forward(request, response);
		}
	%>
</body>
</html>