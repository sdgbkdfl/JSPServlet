<%@page import="dto.Criteria"%>
<%@page import="dto.PageDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Page Nav</title>
</head>
<body>
<script type="text/javascript">
	function go(page){
		location.href="PageNav.jsp?pageNo="+page;
		
	}

</script>



<%
//PageNav의 수정 원본
/*
		int pageNo = request.getParameter("pageNo")==null?
				1:Integer.parseInt(request.getParameter("pageNo"));

		//임의로 페이징처리?
		// 페이징 처리를 위한 Criteria 객체 생성
		Criteria criteria = new Criteria(pageNo); // 한 페이지에 보여줄 게시물 수를 2로 설정
		int total = 300; // 전체 게시물 수 (예시 값)
		PageDto pageDto = new PageDto(total, criteria); // 전체 게시물 수와 Criteria 객체를 전달하여 PageDto 생성
		*/


		if(pageDto.isPrev()){
		// 1페이지 호출
			out.print("<input type='button' value='<<'" 
							+" onclick='go(1)'>");
		// 이전 페이지 블럭
		out.print("<input type='button' value='<'" 
					+" onclick='go("+(pageDto.getStartNo()-1)+")'>");
		}
		for(int i=pageDto.getStartNo();i<=pageDto.getEndNo();i++){
		out.print("<input type='button' value='"+i+"' onclick='go("+i+")'>");
		}
		if(pageDto.isNext()){
		// 이후 페이지 블럭
		out.print("<input type='button' value='>'"
					+" onclick='go("+(pageDto.getEndNo()+1)+")'>");
		// 마지막 페이지 블럭
		out.print("<input type='button' value='>>'"
					+" onclick='go("+(pageDto.getRealEnd())+")'>");
		}
%>
</body>
</html>