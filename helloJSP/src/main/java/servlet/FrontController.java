package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.one")//.one으로 끝나는 모든 요청을 매핑!
public class FrontController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String uri = request.getRequestURI();
		
		//요청경로
		String commandStr = uri.substring(uri.lastIndexOf("/"));
		
		if(commandStr.equals("/regist.one")) {
			registFunc(request);
		}else if(commandStr.equals("/login.one")) {
			loginFunc(request);
		}else if(commandStr.equals("/freeboard.one")) {
			freeboardFunc(request);
			
		}
		request.setAttribute("uri", uri);
		request.setAttribute("commandStr", commandStr);
		//response.getWriter().print(commandStr);
		
		request.getRequestDispatcher("/Servlet/FrontController.jsp").forward(request, response);

	}
	
	// 요청별 처리 메서드
	private void registFunc(HttpServletRequest request) {
		request.setAttribute("resultValue", "<h4>Join</h4>");
		
	}
	private void loginFunc(HttpServletRequest request) {
		request.setAttribute("resultValue", "<h4>Login</h4>");
		
	}
	private void freeboardFunc(HttpServletRequest request) {
		request.setAttribute("resultValue", "<h4>Free Board</h4>");
		
	}

	public FrontController() {
		// TODO Auto-generated constructor stub
	}

}
