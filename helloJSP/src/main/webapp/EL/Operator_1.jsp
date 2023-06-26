<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>연산자</title>
</head>
<body>
<%
	int num1 = 3;
	pageContext.setAttribute("num2", 4);
	pageContext.setAttribute("num3", "5");
	pageContext.setAttribute("num4", "8");

%>
<h3> 변수 선언 및 할당</h3>
	<!-- num1은 4개의 영역에 저장되지 않았으므로 출력되지 않음 -->
	<p>스크립틀릿에서 선언한 변수 : ${num1 }</p>
	<p>페이지영역에서 저장된 변수 : ${num2 }</p>
	
	<!-- 3.0부터 대입 연산자 (=)를 이용하여 값 대입 가능 -->
	<!-- 값을 대입 후 출력 -->
	<p>변수 할당 및 즉시 출력 : ${num1 = 7}</p>
	
	<!-- 값을 대입하고 출력하지 않는 방법 -->
	<p>변수할당 및 별도 출력 : ${num2 = 8;''} =>${num2 }</p>
	
	<!-- 초기값 보기-->
	num1 =${num1 }, num2 =${num2 }, num3 =${num3 } num4 =${num4 }
	
	
<h3> 산술 연산자</h3>
	num1 + num2 = ${num1+num2 }<br>
	num1 - num2 = ${num1-num2 }<br>
	num1 * num2 = ${num1*num2 }<br>
	num1 / num2 = ${num1/num2 }<br>
	
<!-- 표현언어(el)을 이용하면 산술 연산시 자동 숫자 변환 -->
	<!-- 문자형태 연산자 -->	
	<!-- div : 나누기 -->
	num3 / mun4 : ${num3 / num4 }<br>
	num3 div num4 :${num3 div num4 }<br>
		
	<!-- mod : 나머지-->
	num3 % num4 :${num3 % num4 }<br>
	num3 mod num4 :${num3 mod num4 }
	
	
<h3> +연산자는 덧셈만 가능(숫자연산)</h3>
	<!-- 문자열에 대한 연결 기능 없음 -->
	num1 + "34" : ${num1 + "34"}<br>
	num2 + "이십" : \${num2 + "이십" }<!-- 에러발생 --> 


<h3>비교 연산자</h3>
	<!-- 문자형태의 연산자 -->
    num4 > num3 : ${ num4 gt num3 } <br />
    num1 < num3 : ${ num1 lt num3 } <br />
    num2 >= num4 : ${ num2 ge num4 } <br />
	
	<!-- 문자형태의 연산자를 사용하여 코드를 좀더 직관적으로 작성 가능 -->
    num1 == num4 : ${ num1 eq num4 } 
    
<h3>논리 연산자</h3>

    num3 <= num4 && num3 == num4 : ${ num3 le num4 and num3 eq num4 } <br />
    num3 >= num4 || num3 != num4 : ${ num3 ge num4 or num3 ne num4 }








</body>
</html>