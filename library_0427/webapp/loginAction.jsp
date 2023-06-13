<%@page import="com.library.dao.MemberDao"%>
<%@page import="com.util.cookieManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.library.service.MemberService" %>
<%@ page import="com.library.vo.Member" %>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  
<title>Login Action</title>
</head>
<body>
	<%
		//name속성의 값을 매개값으로 넘겨주면 value속성의 값을 반환
		String id = request.getParameter("userid");
		String pw = request.getParameter("userpw");
		
		
		MemberService service = new MemberService();
		Member member = service.login(id,pw);
		
		//아이디 저장 체크박스
		String saveYN = request.getParameter("save_check");
		
		out.print("saveYN : "+saveYN+"<br>");
		
		//lib 파일 이동
		//Java Resource -> webapp/WEB-INF/lib

		
		if(saveYN != null && saveYN.equals("Y")){
			
			cookieManager.makeCookie(response,"userid",id,60*60);
			out.print("id :"+id+"<br>");
		}

		
		//DB조회 결과 id/pw 일치하는 회원이 있으면 로그인 성공
		if(member !=null && !member.getId().equals("")){
			//로그인 성공
			//response.sendRedirect("login.jsp?name="+id);
			
			//쿠키 생성
			//cookieManager.makeCookie(response,"userid",id,60*60);
			
			
			//세션에 저장
			session.setAttribute("member", member);
			 		
			if("admin".equals(member.getId())){
				//관리자 페이지 호출
				response.sendRedirect("loginAdmin.jsp");

			}else{
				//사용자 페이지 호출
				response.sendRedirect("loginMember.jsp");				
			}
						
		}else{
			//로그인 실패
			out.print("로그인 실패");
			//로그인 화면으로 이동
			response.sendRedirect("login.jsp?error=Y");
		}		
	%>

</body>
</html>


