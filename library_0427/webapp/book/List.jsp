<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List</title>
 <link rel="stylesheet" href="../css/book.css">
 <script>
 
 let message = '${message}'
 if(message != null &&"" !=message){
 	alert(message);
 }
 
 function deleteBook(){

	 //체크박스가 선택된 요소의 value값을 ,로 연결
	 //querySelectorAll 메서드를 사용하여 문서에서 "delNo"라는 이름을 가진 체크된 모든 요소를 선택합니다.
	 //선택된 요소는 NodeList 객체로 반환
	 delNoList = document.querySelectorAll("[name=delNo]:checked");
	 
	 let delNo = "";
	 
	 //delNoList.forEach() 메서드는 
	 //delNoList에 포함된 요소들을 반복하면서 각 요소의 값을 delNo 변수에 추가
	 delNoList.forEach((e)=>{
		 delNo += e.value + ',';
	 });
	 
	//변수에 저장된 값에서 마지막 문자(마지막 쉼표)가 제거
	 delNo = delNo.substr(0, delNo.length-1);
	 
	 console.log("삭제할 번호 :" + delNo)
	 
	 //삭제 요청
	 searchForm.action = "../book/delete.book";
	 searchForm.delNo.value = delNo;
	 searchForm.submit();
 }

 </script>
 
</head>
<body>

<%@include file="../common/Header.jsp" %>
<div id=pageTitle>도서 대여 프로그램</div>
<h5>총 건수 : ${map.totalcount}건</h5>
<%@include file="../common/SearchForm.jsp" %>

<table id=listTable border="1" width="100%">
		<c:if test="${sessionScope.adminYN eq 'Y'}">
		<tr>
			<td colspan="5" class="left">
			<!-- 어드민 계정인 경우 등록,삭제 버튼 출력  -->
			<button onclick="location.href='Write.jsp';">도서등록</button>	
			<button onclick="deleteBook()">도서삭제</button>
			</td>
		</tr>
		</c:if>
		
		<tr class= "bg-color2">
			<th>✔ </th>
			<th width="10%">No.</th>
			<th width="*%">도서명</th>
			<th width="15%">저자</th>
			<th id=rentYN width="15%">대여여부</th>
		</tr>
		
	<!-- 리스트가 비어있는지 확인 -->	
	<c:choose>
		<c:when test="${empty map.list }">
			<tr>
				<td colspan="5" align="center">등록된 게시물이 없습니다.</td>
			</tr>
		</c:when>
		
			<c:otherwise>
				<c:forEach items="${map.list }" var="book" step="1">	
				<tr align="center">
					<!-- 삭제용 체크박스 -->
					<td><input type="checkbox" name="delNo" value=" ${book.no}"></td>
					<td>${book.no}</td>
					<td><a href="../book/View.book?no=${book.no}">${book.title}</a></td>
					<td>${book.author }</td>
					<td>${book.rentyn }</td>
				</tr>	
				</c:forEach>
			</c:otherwise>
			
	</c:choose>
	</table>
	<table width="100%" border="1">
		<tr align="center">
	 		<td><%@include file="../common/PageNavi.jsp" %> </td> 
		</tr>	
	</table>
</body>
</html>