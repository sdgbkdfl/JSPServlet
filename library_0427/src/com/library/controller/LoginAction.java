package com.library.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.library.service.MemberService;
import com.library.vo.Member;
import com.util.cookieManager;

/**
 * Servlet implementation class LoginAction
 */
@WebServlet("/login/LoginAction.do")
public class LoginAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//name속성의 값을 매개값으로 넘겨주면 value속성의 값을 반환
		String id = request.getParameter("userid");
		String pw = request.getParameter("userpw");
		
		
		MemberService service = new MemberService();
		Member member = service.login(id, pw);
		
		//아이디 저장 체크박스
		String saveYN = request.getParameter("save_check");
		
		System.out.println("saveYN : "+saveYN );
		
		//lib 파일 이동
		//Java Resource -> webapp/WEB-INF/lib

		
		if(saveYN != null && saveYN.equals("Y")){
			
			cookieManager.makeCookie(response,"userid",id,60*60);
			System.out.println("id :"+id);
		}

		
		//DB조회 결과 id/pw 일치하는 회원이 있으면 로그인 성공
		if(member !=null && !member.getId().equals("")){
			
			HttpSession session =  request.getSession();
			
			//세션에 저장
			session.setAttribute("member", member);
			session.setAttribute("userId", member.getId());
			
			//로그인 성공
			//response.sendRedirect("login.jsp?name="+id);
			
			
			//쿠키 생성
			//cookieManager.makeCookie(response,"userid",id,60*60);
			
			 		
			if("ADMIN".equals(member.getId())){
				session.setAttribute("adminYN", "Y");
				//관리자 페이지 호출
				response.sendRedirect("../book/list.book"); // 상위 디렉토리로 이동하는 상대 경로
				//request.getRequestDispatcher("../book/list.book").forward(request, response); //뷰페이지(jsp)경로 작성
			}else{
				//사용자 페이지 호출
				response.sendRedirect("../loginMember.jsp");				
			}
						
		}else{
			//로그인 실패
			System.out.println("로그인 실패");
			//로그인 화면으로 이동
			response.sendRedirect("../login.jsp?error=Y");
		}		
	}

}
