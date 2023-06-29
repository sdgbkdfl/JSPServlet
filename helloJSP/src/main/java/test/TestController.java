package test;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;





@WebServlet("*.test")
public class TestController extends HttpServlet {
	TestService ts = new TestService();

	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		
		System.out.println("요청 uri : "+ uri);
		
		if(uri.indexOf("testList") > 0) {
			Criteria criteria = new Criteria(request.getParameter("searchField"), request.getParameter("searchWord"), request.getParameter("pageNo"));	
			//list 조회 및 요청 객체에 저장
			Map<String, Object> map= ts.getList(criteria);
			
			request.setAttribute("map", map);
			
			//포워딩
			request.getRequestDispatcher("./testList.jsp").forward(request, response);
			
			}else {
				request.setAttribute("message", "조회에 실패하였습니다.");	
			}	
		
		}

	
	public TestController() {
		// TODO Auto-generated constructor stub
	}

}
