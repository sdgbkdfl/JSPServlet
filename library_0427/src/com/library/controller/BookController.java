package com.library.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.library.service.BookService;

//book으로 끝나는 요청 모두 bookController에서 제어
@WebServlet("*.book")
public class BookController extends HttpServlet{
	
	BookService bs = new BookService();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	String uri = request.getRequestURI();
	
	System.out.println("요청 uri : "+ uri);
	
		if(uri.indexOf("list")>0) {
			//list 조회
			request.setAttribute("list", bs.getList());
			request.getRequestDispatcher("./List.jsp").forward(request, response);
			
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}
	
	public BookController() {
		// TODO Auto-generated constructor stub
	}

}
