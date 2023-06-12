<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>JSP에서 자바코드 작성하는 방법</h2>
<p>JSP Scripting Element
	<ul>
		<li>선언문 :변수, 메서드를 선언 </li>
		<li>스크립틀릿 : 자바 코드 작성</li>
		<li>표현식: 값 출력</li>
	</ul>
</p>	
	<!-- 선언부 -->
	<p>
	JSP파일이 서블릿 파일로 변환시 
	_jspService()메서드 외부에 선언
	그래서 전역변수임
	</p>
	<%!
	//선언부 전역변수 선언
	String str ="Java Server Page";
	//메서드 선언
	public int add (int num1, int num2){
		return num1 + num2;
	}
	%>
	<!-- 스크립틀릿 -->
	<p>
	자바코드를 작성하는 영역
	JSP파일이 서블릿 파일로 변환시
	_jspService()메서드 내부에 기술하므로 다른 메서드 선언불가.
	</p>
	<%
	//지역변수
	 int res = add(10,20);
	%>
	<!-- 표현식 -->
	<p>변수, 상수, 수식 등을 출력</p>
	<h1><%=str%></h1>
	<h1><%=res%></h1>
	<h1><%=add(10,20)%></h1>
</body>
</html>