<%@page import="util.cookieManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="css/gogreen.css">
   
</head>

<body> 
    <div class="wrap">
	<%@ include file="gogreen_header.jsp" %>
       
        
        <main>
            <aside id='leftside'>

            </aside>
            <div id='maincontent'>
                <ul>
                    <li><img src="images/main_img1.jpg" alt="">나무를 심는 사람들</li>
                    <li><img src="images/main_img2.jpg" alt="">아이들에게 녹색 미래를..</li>
                    <li><img src="images/main_img3.jpg" alt="">설악산을 살리는 길</li>
                    <li><img src="images/main_img4.jpg" alt="">사라지는 북극곰들</li>
                </ul>
            </div>

            <aside id='rightside'>
                <div class='side1'>
	            	<!-- 
	            	로그인 실패 : 메세지 처리
		           	로그인 성공 : 로그인 박스 보여주지않음
		           	 		   a님 환영합니다. 출력
		          	-->
		        <%
		        	//쿠키에 저장된 아이디가 있다면 아이디를 텍스트 필드에 value값으로 출력
		        	String userId = cookieManager.readCookie(request,"userid");
		        
                	// 로그인 실패시 메세지 처리
                	String loginErr = request.getParameter("loginErr");
                	if("y".equals(loginErr)){
                		out.print("<script>alert('아이디/비밀번호를 확인해주세요')</script>");
                	}
                %>
                <!-- 로그인 : 
                	method를 post로 설정해서 아이디/비밀번호가 노출되는걸 막아줍니다 -->
                <%
                	//세션
                	String name="";
                	if(session.getAttribute("id") !=null){
                		name = (String)session.getAttribute("id");
                	}
                	
                	///String name = request.getParameter("name");
       
                
	                if(name != null && !name.equals("")){
	                	// 로그인 되었다고 판단
	                	// out.print(name + "님 환영 합니다.");
	                	
	            %>
	            
	
	            	<%= name + "님 환영 합니다." %>
	            	<!-- 버튼누르면 페이지 이동... -->
	            	<button onclick="location.href='logout.jsp'">로그아웃</button>
	           
	            	
	            <% 
	               } else {
                %>
                
                 <form action="loginAction.jsp" method="post">
                      	
                    <div class='loginbox'>
                        <div id='login'>
                            <input type="text" name="userid" id="userpw" placeholder='ID를 입력해주세요.' value="<%=userId%>"><br>
                            <input type="password" name="userpw" id="userpw" placeholder='PW를 입력해주세요.'><br>
                            
                        </div>
                        <div id='button'>
                        <input type="submit" value="로그인">
                        </div>
                    </div>
                    <div id='info'>
                    
                    <!-- 선택되었을때만 서버에 넘어가고 선택안하고 값 출력하면 null출력 -->
                    <input type="checkbox" name="save_check" value="Y" <%=userId.equals("")?"checked":"" %>>아이디 저장하기<br>
                        <a href="">회원가입</a>
                        <a href="">ID찾기</a>
                        <a href="">PW찾기</a>
                    </div>
                </form>
                <%
                } 
                %>
                </div>

              <div class='side2'>
                    <img src="images/right_img.jpg" alt="" >
                </div>

                <div class='side3'>
                    <img src="images/me_chat.jpg" alt="">
                </div>

            </aside>
        </main>        
    </div>

<%@ include file="gogreen_footer.jsp" %>
</body>
</html>