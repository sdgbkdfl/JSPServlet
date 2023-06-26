<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hello Servlet!</title>
</head>
<body>
표현식 : <%=request.getAttribute("message") %><br>
EL : ${requestScope.message }<br>
<!-- null :request 영역 공유 안되서--> 


<!-- ./ : 현재 경로  -->
<a href="./HelloServlet.do">HelloServlet.do 바로가기</a><br>
<a href="${pageContext.request.contextPath }/Servlet/AnnotationMapping.do">AnnotationMapping.do 바로가기</a>

</body>
</html>