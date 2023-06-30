
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- 검색 폼 -->
	<form method ="get" name="searchForm">
	
	<!-- 페이지번호 -->
	<input type="text" name="pageNo">
	<input type="text" name="delNo">
	
	<table width="100%" border="1">	
		<tr align="center">
			<td>
				<select name="searchField" style="width:10%; display:inline-block;">
					<option value="title"  ${(param.searchField eq "title")? "selected":""}>도서명</option>
					<option value="author" ${(param.searchField eq "author")? "selected" : ""}>저자</option>
				</select>
				<input type="text" name="searchWord" value="${param.searchWord}" style="width:30%; display:inline-block;"/>
				<input type="submit" value="검색" style="width:10%; display:inline-block;"/>
			</td>
		</tr>
	</table>	
	</form>
</body>
</html>