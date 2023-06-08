<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head><title>내장 객체 - response</title></head>
<body>
    <h2>1. 로그인 폼</h2>
   	<%
   		//오류가 발생항 경우
   		//메세지를 출력
   		 String loginErr =request.getParameter("loginErr");
   		if("y".equals("loginErr")){
   			out.print("아이디/비밀번호 확인 요망");
   		}
   	%>
    <form action="./responseLogin.jsp" method="post">
        아이디 : <input type="text" name="user_id" required value="<%=request.getParameter("user_id")%>" /><br />
        패스워드 : <input type="text" name="user_pwd" /><br />
        <input type="submit" value="로그인" />
    </form>

    <h2>2. HTTP 응답 헤더 설정하기</h2>
    <form action="./responseHeader.jsp" method="get">
        날짜 형식 : <input type="text" name="add_date" value="2021-10-25 09:00" /><br />  
        숫자 형식 : <input type="text" name="add_int" value="8282" /><br />
        문자 형식 : <input type="text" name="add_str" value="금잔디" /><br />
        <input type="submit" value="응답 헤더 설정 & 출력" />
    </form>
</body>
</html>