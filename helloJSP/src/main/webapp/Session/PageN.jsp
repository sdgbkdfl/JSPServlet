<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		/* include 시 충돌나기 때문에 주석 처리
		int pageNo = request.getParameter("pageNo")==null?
				1:Integer.parseInt(request.getParameter("pageNo"));

		//임의로 페이징처리?
		// 페이징 처리를 위한 Criteria 객체 생성
		Criteria criteria = new Criteria(pageNo); // 한 페이지에 보여줄 게시물 수를 2로 설정
		int total = 55; // 전체 게시물 수 (예시 값)
		PageDto pageDto = new PageDto(total, criteria); // 전체 게시물 수와 Criteria 객체를 전달하여 PageDto 생성
		*/
		
		if(pageDto.isPrev()){
			//1페이지 호출
			out.print("<input type='button' value='<<' onclick='go(1)'>");
		}
		if(pageDto.isPrev()){
			//이전페이지
			out.print("<input type='button' value='<' onclick='go("+(pageDto.getStartNo()-1)+")'>");
		}
		//반복문 이용하여 페이지 번호 버튼 출력
		for(int i=pageDto.getStartNo();i<=pageDto.getEndNo();i++){
			out.print("<input type='button' value='"+i+"'onclick='go("+i+")' >");
		}
		if(pageDto.isNext()){
			//다음페이지
			out.print("<input type='button' value='>' onclick='go("+(pageDto.getEndNo()+1)+")' >");			
		}
		if(pageDto.isNext()){
			//마지막 페이지 호출
			out.print("<input type='button' value='>>' onclick='go("+(pageDto.getRealEnd())+")' >");
		}
%>
</body>
</html>