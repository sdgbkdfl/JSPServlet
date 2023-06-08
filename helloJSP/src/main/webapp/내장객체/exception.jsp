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
//response객체로 부터 에러코드 확인
int status =response.getStatus();

//에러 코드에 맞게 적절한 메세지 출력
if(status==404){
	out.print("ErrorCode : 404");
	out.print("<br>파일 경로를 확인해주세요.");
	
}else if(status == 405){
	out.print("ErrorCode : 405");
	out.print("<br>요청방식(method)를 확인해주세요.");
	
}else if(status ==500){
	out.print("ErrorCode : 500");
	out.print("<br>관리자에게 문의해주세요");
	
}


%>
</body>
</html>