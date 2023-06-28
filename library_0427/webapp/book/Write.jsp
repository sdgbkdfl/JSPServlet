<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <link rel="stylesheet" href="../css/book.css">

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 등록</title>
<%@include file="../common/Header.jsp" %>  



<script type="text/javascript">
    function validateForm(form) {  // 필수 항목 입력 확인
        if (form.name.value == "") {
            alert("작성자를 입력하세요.");
            form.name.focus();
            return false;
        }
        if (form.title.value == "") {
            alert("제목을 입력하세요.");
            form.title.focus();
            return false;
        }
        if (form.content.value == "") {
            alert("내용을 입력하세요.");
            form.content.focus();
            return false;
        }
        if (form.pass.value == "") {
            alert("비밀번호를 입력하세요.");
            form.pass.focus();
            return false;
        }
    }
</script>
</head>
<h2>도서 등록</h2>
<form name="writeFrm" method="post" enctype="multipart/form-data"
      action="./write.book" onsubmit="return validateForm(this);">
    

<table border="1" width="90%">
    <tr>
        <td>아이디</td>
        <td>
            <input type="text" name="id" style="width:150px;" value="${sessionScope.userId }" readonly="readonly"/>
        </td>
    </tr>
    <tr>
        <td>제목</td>
        <td>
            <input type="text" name="title" style="width:90%;" value="모순" />
        </td>
    </tr>
    <tr>
        <td>저자</td>
        <td>
            <input type="text" name="author" style="width:150px;" value="양귀자" />
        </td>
    </tr>
    <tr>
        <td>책이미지</td>
        <td>
            <input type="file" name="bookImg" style="width:150px;" />
        </td>
    </tr>

        <td colspan="2" align="center">
        	<!-- 글쓰기 버튼 클릭 하면 글등록 -->
            <button type="submit">작성 완료</button>
            <button type="reset">RESET</button>
            <button type="button" onclick="location.href='../book/list.book';">
                목록 바로가기
            </button>
        </td>
    </tr>
</table>    
</form>
</body>
</html>