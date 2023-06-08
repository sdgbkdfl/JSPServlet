<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장객체 Application</title>
</head>
<body>
<!-- 
	application: 모든 jsp 페이지에서 접근 가능한 객체
	web.xml : 배포 서술자 웹 어플리케이션에 대한 여러가지 설정 정보 저장 파일
	서버의 물리적 경로 : 이클립스에서 지정한 임의의 경로 출력
 -->
 
 <%
 //xml에 설정한 파라메터 읽어오기
 String init = application.getInitParameter("INIT_PARAM");
 
 // 서버의 물리적 경로 읽어오기
 String path = application.getRealPath("/내장객체");
 
 %>
	 <h1>applicaion</h1>
	 
	 초기화 매개변수 : <%=init %><br>
	 내장객체의 물리적 주소 : <%=path %>
	 
	 <h2>선언부에서 application 내장객체 사용</h2>
 <%!
 	//메서드 선언, 필드선언
 	public String useImplicitObject(){
	 return this.getServletContext().getRealPath("/내장객체");
	 }
	public String useImplicitObject(ServletContext app){
	 return app.getRealPath("/내장객체");
 }
 %>
 
	 <ul>
		 <li>this사용 : <%=useImplicitObject() %></li>
		 <li>내장객체를 인수로 전달 : <%=useImplicitObject(application) %></li>
	 </ul>
</body>
</html>