<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<table border="1" width="90%"> 
    <tr>
        <td align="center">
        
        <%
        if(session.getAttribute("userId") != null ){
        %>
        	<a href="../Session/logout.jsp">로그아웃</a>   
  
		<%         
        }else{  %>  
        	 <a href="../Session/LoginForm.jsp">로그인</a>
        <% 
        }
        %> 
            <!-- 8장과 9장의 회원제 게시판 프로젝트에서 사용할 링크 -->
            &nbsp;&nbsp;&nbsp; 
            <a href="../08Board/List.jsp">게시판(페이징X)</a>
            &nbsp;&nbsp;&nbsp; 
            <a href="../09PagingBoard/List.jsp">게시판(페이징O)</a>
        </td>
    </tr>
</table>
