package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//annotation 이용하여 서블릿 매핑처리
@WebServlet("/Servlet/AnnotationMapping.do") //.do는 just 식별자
public class AnnotationMapping extends HttpServlet {

	
	@Override //do 오버라이딩 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
		
		request.setAttribute("message", "AnnotationMapping.do 호출");
		request.getRequestDispatcher("HelloServlet.jsp").forward(request, response);
		
	}
	public AnnotationMapping() {
		// TODO Auto-generated constructor stub
	}

}
