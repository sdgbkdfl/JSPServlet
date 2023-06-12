<%@page import="util.cookieManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
</head>
<body>
<form action="loginAction.jsp" method="post">
	 <% 
	 	String userId = cookieManager.readCookie(request,"userid");
	 
	 
 	//쿠키에 저장된 아이디가 있다면 id필드의 value속성에 아이디 값을 넣어줌
 	//저장된 아이디 보여주기
	 /*
	 	Cookie[] cookies = request.getCookies();
	 	String userid ="";
	 	if(cookies !=null){
			for(Cookie cookie : cookies){
				if("userid".equals(cookie.getName())){
				userid = cookie.getValue();
				break;
				}				
			}	 		
	 	}
	 */
    	String name = request.getParameter("name");
    	if(name != null && !name.equals("")){
    		out.print("<h1>" + name + "님 환영 합니다.</h1>");
    	} else {
    		
    %>

    <div class='loginbox'>
        <div id='login'>
            <input type="text" name="userid" id="userid" placeholder='ID를 입력해주세요.' value="<%=userId%>"><br>
            <input type="password" name="userpw" id="userpw" placeholder='PW를 입력해주세요.'><br>

           
        </div>
        <div id='button'>
        <input type="submit" value="로그인">
        </div>
    </div>
    <div id='info'>
    <input type="checkbox" name="save_check" value="Y" <%=userId.equals("")?"checked":"" %>>아이디 저장하기<br>
        <a href="">회원가입</a>
        <a href="">ID찾기</a>
        <a href="">PW찾기</a>
    </div>
    
    <%
    } 
    %>
</form>
</body>
</html>