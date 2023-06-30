package com.library.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.library.common.FileUtil;
import com.library.common.JSFunction;
import com.library.service.BookService;
import com.library.vo.Book;
import com.library.vo.Criteria;
import com.oreilly.servlet.MultipartRequest;


//book으로 끝나는 요청 모두 bookController에서 제어
@WebServlet("*.book")
public class BookController extends HttpServlet{
	
	BookService bs = new BookService(); 
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	String uri = request.getRequestURI();
	System.out.println("요청 uri : "+ uri);
	
		if(uri.indexOf("list") > 0) {
			
			//검색조건 셋팅
			Criteria criteria = new Criteria(request.getParameter("searchField"), request.getParameter("searchWord"), request.getParameter("pageNo"));
			
			//list 조회 및 요청 객체에 저장
			Map<String, Object> map= bs.getListPage(criteria);
			request.setAttribute("map", map);
			
			//포워딩
			request.getRequestDispatcher("./List.jsp").forward(request, response);
			
		}else if(uri.indexOf("delete") > 0){
			int res = bs.delete(request.getParameter("delNo"));
			
			if(res > 0) {
				request.setAttribute("message", res +"건 삭제되었습니다.");
				
			}else {
				request.setAttribute("message", "삭제에 실패하였습니다.");	
			}
			
			//포워딩
			//삭제 후 바로 리스트 페이지로 이동
			//response.sendRedirect("./list.book");
			//sendRedirect : request영역을 공유하지 않으므로 삭제는 되나,
			//request.setAttribute 받아오지 못함
			request.getRequestDispatcher("./List.jsp").forward(request, response);
			
		} else if(uri.indexOf("write") > 0) {
			
			response.sendRedirect("./Write.jsp");
			
		}else if(uri.indexOf("View") > 0) {
				
			//게시물 조회 
			Book book = bs.selectOne(request.getParameter("no"));
			
			//조회된 게시물 저장(request 영역)
			request.setAttribute("dto", book);
			
//			System.out.println(book);
			
			if(book != null) {  
			// 상세화면
			//view.jsp페이지로 포워딩
			request.getRequestDispatcher("../book/View.jsp").forward(request, response);
			
			}else {
				JSFunction.alertBack(response, "도서번호에 해당하는 도서가 존재하지 않습니다.");
			}
		} else {
				JSFunction.alertBack(response, "url을 확인해주세요!");
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// post요청도 get을 호출함(?)
		String uri = request.getRequestURI();
		
		System.out.println("요청 uri : "+ uri);
		
		if(uri.indexOf("write") > 0) {
			//도서등록
			String saveDirectory = "C:\\Users\\user\\git\\JSPServlet\\library_0427\\webapp\\images\\bookimg";
		
			MultipartRequest mr = FileUtil.uploadFile(request, saveDirectory, 1024*1000); 	//크기지정
			
			Book book = new Book(
					mr.getParameter("title"),
					mr.getParameter("author")
					);
					
			String ofile = mr.getFilesystemName("bookimg");
			System.out.println("ofile" + ofile);
			
			if(ofile !=null && !"".equals(ofile)) {
				String sfile = FileUtil.fileNameChange(saveDirectory, ofile);
				
				book.setOfile(ofile);
				book.setSfile(sfile);
			
			}
			int res = bs.insert(book);
			
			if(res > 0) {
				response.sendRedirect("./list.book");
//				JSFunction.alertLocation(response, "./list.book", "등록되었습니다.");
				
			}else {
				JSFunction.alertBack(response, "등록 중 예외사항이 발생했습니다.");
				//포워딩
				//request.getRequestDispatcher("./list.book").forward(request, response);
			}
//----------------------------------------------------------------------------------------
				
		
		} else if(uri.indexOf("rent") > 0) {
			//로그인 아이디 확인
			HttpSession session = request.getSession();
			
			if(session.getAttribute("userId") == null) {
				JSFunction.alertBack(response, "로그인 후 이용 가능한 메뉴입니다.");
				return;
			}
			
			//대여하기 - 책번호, 아이디
			Book book = new Book();
			book.setNo(request.getParameter("no"));
			book.setId(session.getAttribute("userId").toString());
			
			int res = bs.rentBook(book);
			
			if(res > 0) {
				JSFunction.alertLocation(response, "./View.book?no="+book.getNo(), "대여를 완료하였습니다.");
			}else {

			JSFunction.alertBack(response, "오류가 발생하였습니다.");
			}
		}
		
	}
	

	
	public BookController() {
		// TODO Auto-generated constructor stub
	}

}
