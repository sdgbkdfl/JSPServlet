package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MyServlet extends HttpServlet {
	
	@Override //부모가 가진 메서드 재정의
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("message", "서블릿 호출");
		
		
		//PrintWriter out = request.getWriter();
		
		//out.print("서블릿 호출");
		//request.getWriter().print("서블릿 호출");
		
		//request영역이 공유안되기 때문에 화면에 메시지 출력안됨
		//response.sendRedirect("HelloServlet.jsp");
		
		//forward : request영역이 공유
		request.getRequestDispatcher("HelloServlet.jsp").forward(request,response);
	}

	public MyServlet() {
		
	}

}
