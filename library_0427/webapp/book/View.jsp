<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 상세보기</title>
<script type="text/javascript">
	function setAction(action){
		viewForm.action=action;
	}
</script>
</head>

<body>
<h2>도서 - 상세 페이지</h2>

${map.pageDto }
<%@include file="/common/Header.jsp" %>
<form name="viewForm " method="post">
도서번호 : <input name="no" value="${dto.no }">
대여번호 : <input name="rentno" value="${dto.rentno }">

<table border="1" width="90%">
    <colgroup>
   		 <col width="30%"/>
        <col width="15%"/> <col width="20%"/>
        <col width="15%"/> <col width="20%"/>
    </colgroup>

    <!-- 게시글 정보 -->
    <tr>
        <td rowspan="3">
        <img alt="${dto.title }이미지" width="200px" src="../images/bookImg/${dto.sfile }"></td>
        <td>도서명</td> <td>${ dto.title }</td>
        <td>작가</td> <td>${ dto.author }</td>   
    </tr>
    <tr>
		<td>대여</td>
		<c:choose>
			<c:when test="${empty dto.rentno }">
				<td colspan="3">
				<button onclick="setAction('./rent.book')">대여하기</button>
			</c:when>
			<c:when test="${dto.id eq sessionScope.userId }">
				<td><button onclick="setAction('./return.book')">반납하기</button>
				<td>대여기간</td>
				<td>${dto.startDate } ~ ${dto.endDate }</td>
			</c:when>
		</c:choose>
		
    </tr>
    <tr>
    	<td>상세설명</td>
    	<td></td>
    </tr>


    <!-- 하단 메뉴(버튼) -->
    <tr>
        <td colspan="4" align="center">
            <button type="button" 
            		onclick="location.href='./edit.book?no=${dto.no}'';">
                수정하기
            </button>
            <button type="button" onclick="location.href='./delete.book?delNo=${ dto.no }';">
                삭제하기
            </button>
            <button type="button" onclick="location.href='./list.book';">
                목록 바로가기
            </button>
        </td>
    </tr>
</table>
</form>
</body>
</html>
