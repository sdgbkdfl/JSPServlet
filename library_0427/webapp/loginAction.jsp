<%@page import="com.util.cookieManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.library.service.MemberService" %>
<%@ page import="com.library.vo.Member" %>
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
		
		//아이디 저장 체크박스
		String saveYN = request.getParameter("save_check");
		
		
		//lib 파일 이동
		//Java Resource -> webapp/WEB-INF/lib
				
		MemberService service = new MemberService();
		Member member = service.login(id,pw);
		
		if(member !=null && !member.getId().equals("")){
			//로그인 성공
			
			//쿠키 생성
			cookieManager.makeCookie(response,"userid",id,60*60);
			
			//세션에 저장
			//session.setAttribute("member", member);
		
	
			//out.print("<script>alert(''member.getId()'+님 환영합니다.');</script>");
	 		
			if("admin".equals(member.getId())){
				//관리자 페이지 호출
				response.sendRedirect("loginAdmin.jsp");
				
				
			}else{
				//사용자 페이지 호출
				response.sendRedirect("loginMember.jsp");				
			}
						
		}else{
			//로그인 실패
			//로그인 화면으로 이동
			response.sendRedirect("login.jsp?error=y");
		}		
	%>

</body>
</html>


