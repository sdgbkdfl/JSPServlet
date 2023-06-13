<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Form Value</title>
</head>
<body>
<!-- 폼에 있는 값을 한번에 객체에 담아오는거 할거임 -->
<h2>액션태그로 폼값 한번에 받기</h2>
<form method="post" action="useBeanAction.jsp">
	이름 : <input type="text" name="name"> <br>
	나이 : <input type="text" name="age"> <br>
	<input type="submit" value="폼값 전송">

</form>
</body>
</html>