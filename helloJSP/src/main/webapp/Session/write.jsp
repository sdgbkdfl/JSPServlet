<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Write Board</title>
</head>
<body>
<jsp:include page="Link.jsp" />
<h2>회원제 게시판 - 글쓰기(Write)</h2>
<form name="writeFrm" method="post" action="WriteProcess.jsp"
      onsubmit="return validateForm(this);">
	<table border="1" width="90%">
		<tr>
			<th>제목</th>
			<td>
				<input type="text" name="title" style="width: 90%;" />			
			</td>		
		</tr>
	
		<tr>
			<th>내용</th>
			<td>
				<textarea name="content" style="width: 90%; height: 100px;"></textarea>			
			</td>		
		</tr>
	
		<tr>
			<td colspan="2" align="center">
	                <button type="submit">작성완료</button>
	                <button type="reset">다시입력</button>
	                <button type="button" onclick="location.href='makeBoard.jsp';">
	                    목록보기</button>	
			</td>
		</tr>	
	</table>
</form>
</body>
</html>