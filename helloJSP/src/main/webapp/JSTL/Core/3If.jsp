<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h4>JSTL의 IF 태그로 짝수/홀수 판단하기</h4>
	<!-- 변수 선언 -->
	<c:set var="number" value="100"/> 
	
	<!-- number를 2로 나눈 나머지가 0과 같다. -->
	<c:if test="${number mod 2 eq 0 }" var="result">
	<!-- 조건이 참인 경우 실행 -->
	${number } 은 짝수 입니다.
	</c:if>
	result : ${result }<br>
	
<h4>문자열 비교와 else 구문 흉내내기</h4>
	<c:if test="${not result }" var="result2">
		${number }는 홀수 입니다.<br>
	</c:if>		
	
<!-- 문자열 변수 선언 -->
<c:set var="str" value="JSP"/>
<c:if test="${str eq 'Java' }" var="result3">
문자열은 Java입니다.<br>
</c:if>

<c:if test="${not result3 }">
'java'가 아닙니다.
</c:if>	

<h4>조건식 주의사항</h4>
<!-- 표현언어(EL)를 사용하지 않는 경우 -->
<c:if test="100" var="result4">
일반값을 입력 : false
</c:if>
result4 : ${result4}

<c:if test="truE" var="result5">
대소문자 구분없이 true<br>
</c:if>
result5 : ${result5}

<c:if test="${true }" var="result6">
EL 공백이 삽입된 경우 false<br>
</c:if>
result6 : ${result6}


	
	
	
	
	
	
</body>
</html>