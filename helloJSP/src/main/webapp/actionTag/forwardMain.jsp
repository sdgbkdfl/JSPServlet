<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>액션 태그 - forward</title>
</head>
<body>
	<h2>액션태그를 이용한 포워딩</h2>
	<!-- 새로운 페이지로 포워드
		page영역은 공유되지않고
		request영역은 공유됨 
	-->
	<%

		request.setCharacterEncoding("utf-8");
	
		pageContext.setAttribute("pAttr","페이지영역");
		request.setAttribute("rAttr", "요청영역");
	%>
	<jsp:forward page="forwardSub.jsp">
		<jsp:param value="페이지영역" name=pAttr"/>
	</jsp:forward>

</body>
</html>