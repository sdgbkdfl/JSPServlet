<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Out 객체</title>
<!--  
	웹브라우저에 변수 등의 값을 출력 할 때 사용
	스크맂틀릿 내부에서 변수등 출력하기 위해 사용
-->

<%
	//버퍼내용 삭제하기
	out.print("몽요일이당");//버퍼에 저장
	out.clearBuffer(); //버퍼 비움
	
	// 기본크기 8kb(1kb=1024byte)
	out.print("출력 버퍼의 크기 : " +out.getBufferSize()+"<br>");
	out.print("남은 버퍼의 크기 : " +out.getRemaining()+"<br>");
	
	out.flush(); //버퍼의 내용을 출력
	out.print("남은 버퍼의 크기 : " +out.getRemaining()+"<br>");
	
	//다양한 타입을 출력할 수 있음
	out.print(1);
	out.print(false);


%>
</head>
<body>

</body>
</html>