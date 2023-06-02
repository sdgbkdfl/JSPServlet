<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장객체 - request</title>
</head>
<body>
	<h2>1. 클라이언트와 서버의 환경정보 읽기</h2>
	<!-- method를 지정하지않은 경우는 모두 get방식으로 호출 -->
	
	<!-- 404 :페이지를 찾을 수 없음
	서버에 파일이 없는 경우, 또는 경로가 일치하지 않는 경우
	→ url 경로 확인!! -->
	
	<a href= "requestWebInfo.jsp?eng=hello&han=안녕">get 방식 요청</a>
	
	<form action="RequestWebInfo.jsp" method="post">
	영어 : <input type="text" name="eng" value="bye">	<br>
	한글 : <input type="text" name="han" value="바이">	<br>
	<input type="submit" value="post전송">	
	</form>
	
	
	<h2>2. 클라이언트의 요청 매개변수 읽기</h2>
	<form method="post" action="RequestParameter.jsp" >
	<!-- 다양한 input태그를 사용하여 서버에 값을 전달해봅시다 -->
	
	아이디:
	<input type="text" id="id" name="id" required><br>
	성별:
	<input type="radio" id="male" name="gender" value="남자" required>남
	<input type="radio" id="female" name="gender" value="여자" required>여<br>
	관심사항:
	 <input type="checkbox" id="study" name="favo" value="공부">공부
	 <input type="checkbox" id="hiking" name="favo" value="등산">등산
	 <input type="checkbox" id="fishing" name="favo" value="낚시" >낚시
	  <input type="checkbox" id="shopping" name="favo" value="쇼핑">쇼핑<br>
	자기소개:
	 <textarea id="introduction" name="intro" maxlength="100" placeholder='100자 이내로 작성하세요' required></textarea>
	 <input type="submit" value="post전송">
	</form>
</body>
</html>