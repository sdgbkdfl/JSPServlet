<%@page import="util.cookieManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키를 활용한 팝업창 제어 ver3.0</title>
<!-- 자바스크립트 이용 -->
<script>
//페이지가 로드되면 실행
window.onload = function(){
	//버튼이 클릭되면 함수 실행	
	closeBtn.onclick = function(){
	//버튼이 클릭되면 팝업창 숨기기
	popup.style.display = 'none';
	
	let chkVal = document.querySelector("input[id=inactiveToday]:checked");
	
		//체크박스가 체크된 상태라면
		if(chkVal !=null && chkVal ==1){
			//JavaScript를 활용한 쿠키 생성 
			const date = new Date();
			//12시간
			date.setTime(date.getTime()+12*60*60*1000);
			document.cookie = "PopupClose=off;expires="+date.toGMTString();

			}
			
		}	
	}	

		
</script>
<style>
    div#popup {
        position: absolute; top:100px; left:50px; color:yellow;  
        width:270px; height:100px; background-color:gray;
    }
    div#popup>div {
        position: relative; background-color:#ffffff; top:0px;
        border:1px solid gray; padding:10px; color:black;
    }
    .off{
    	display: none;
    }
</style>
</head>
<body>

<h2>🍪쿠키를 활용한 팝업창 제어 ver2.0🍪</h2>
	<%
	String popupClose =	cookieManager.readCookie(request, "PopupClose");
	//쿠키에 PopupClose가 등록되어 있으면 class속성을 이용해 팝업창을 출력하지 않도록 처리
	String off = popupClose.equals("")? "": "off";
	%>
	
	<div id="popup" class="<%=off %>">
        <h2 align="center">공지사항 팝업입니다💥 </h2>
        <div align="right">
	        <form name="popFrm" action="PopupCookie.jsp">
	            <input type="checkbox" id="inactiveToday" value="1" /> 
	            하루 동안 열지 않음
	            <input type="button" value="닫기" id="closeBtn" /> 
	            
	        </form>
        </div>
    </div>
</body>
</html>