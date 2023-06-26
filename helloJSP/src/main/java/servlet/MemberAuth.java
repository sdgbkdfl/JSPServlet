package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import dto.Member;

public class MemberAuth extends HttpServlet {

	
	MemberDao dao;
	
	@Override
	public void init() throws ServletException {
		 dao = new MemberDao();
	}
	
	
	@Override  
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String admin_id = this.getInitParameter("admin_id");
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		Member member = dao.login(id, pw);
		
		if(member != null) {
			request.setAttribute("authMessage", member.getName()+ "님 환영합니다.");
			
			if(member.getId().equals(admin_id)) {
				request.setAttribute("authMessage", admin_id + "관리자입니다.");
			}
		}else {
			request.setAttribute("authMessage", member.getName()+ "로그인에 실패했습니다.");
			
		}
		
		request.getRequestDispatcher("/Servlet/MemberAuth.jsp").forward(request, response);
		//response.sendRedirect("/Servlet/MemberAuth.jsp");
	}
	
	public MemberAuth() {
		
	}

}
