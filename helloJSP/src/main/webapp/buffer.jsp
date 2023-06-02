<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"% errorPage="errorPage.jsp"%>
    <%@ page buffer="1kb" autoFlush="false" %>
    <!-- Error : JSP 버퍼 오버 플로우
    버퍼의 크기 ↑ or autoFlush를 false로 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<!-- 버퍼(Buffer) :
		응답결과를 웹 브라우저로 즉시 전송하지 않고 출력할 내용을 버퍼에 저장해 두었다가 일정량 차면 클라이언트로 전송 
		
		버퍼 사용 이유:
		- 성능향상
		- JSP 실행도중 버퍼를 비우고 새로운 내용으로 전송 가능
		- 버퍼가 다 차기 전에, 응답 헤더를 변경가능
		
		autoFlush
		- true : 버퍼차면, 자동 전송
		- false : 예외 Exception 발생으로 실행 중지
		
		-->
<%
	for(int i =0; i<100;i++){
		out.println("abcde12345");
	}
	out.println(out.getBufferSize());
	out.println(out.isAutoFlush());
%>


	<h1></h1>
</body>
</html>