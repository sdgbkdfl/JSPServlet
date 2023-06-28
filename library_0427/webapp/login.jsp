<%@page import="com.util.cookieManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Library Login</title>
    <link rel="stylesheet" href="css/book.css">
</head>
<body>

<%
	//String error = request.getParameter("error");
	//if(error != null && "Y".equals(error)){
	//	out.print("아이디 비밀번호를 확인바랍니다.😫");
	//}
%>
<aside id='rightside'>
	<div class='side1'>
		<!-- 
		로그인 실패 : 메세지 처리
		로그인 성공 : 로그인 박스 보여주지않음
		a님 환영합니다. 출력
		-->
<%
  	//쿠키에 저장된 아이디가 있다면 아이디를 텍스트 필드에 value값으로 출력
  	String userId = cookieManager.readCookie(request,"userid");
  
    // 로그인 실패시 메세지 처리
    String loginErr = request.getParameter("loginErr");
    if("Y".equals(loginErr)){
    	out.print("<script>alert('아이디/비밀번호를 확인해주세요')</script>");
  }
 %>		
	</div>
</aside>
<form action="./login/LoginAction.do" method="post">
	<div class='loginbox'>
    	<div id='login'>
            <input type="text" name="userid" id="userid" placeholder='ID를 입력해주세요.' value="<%=userId%>"><br>
                <input type="password" name="userpw" id="userpw" placeholder='PW를 입력해주세요.'>
            </div>
            <div id='button'>
            	<input type="submit" value="로그인">
            </div>
        </div>        
        <div id='info'>
          <!-- 선택되었을때만 서버에 넘어가고 선택안하고 값 출력하면 null출력 -->
			<input type="checkbox" name="save_check" value="Y" <%=userId.equals("")?"checked":"" %>>아이디 저장하기<br>
	        <a href="">회원가입</a>
	        <a href="">ID찾기</a>
	        <a href="">PW찾기</a>
    </div>
 
</Form>
</body>
</html>