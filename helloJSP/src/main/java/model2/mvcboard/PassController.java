package model2.mvcboard;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.JSFunction;

// 비밀번호 검증,삭제
@WebServlet("/mvcboard/pass.do")
public class PassController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//mode : 수정(edit), 삭제(delete)
		//request.setAttribute("mode", request.getParameter("mode"));
		//request.setAttribute("idx", request.getParameter("idx"));
		
		request.getRequestDispatcher("../MVCBoard/Pass.jsp").forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idx = request.getParameter("idx");
		String mode = request.getParameter("mode");
		String pass = request.getParameter("pass");
		
		MVCBoardDAO dao = new  MVCBoardDAO();
		
		//게시글의 비밀번호가 일치하는지 확인
		boolean confirmed = dao.confirmPassword(pass, idx);
		
		
		//비밀번호 체크 성공
		if(confirmed) {
			System.out.println("비밀번호 검증 성공");
			
			if(mode.equals("edit")) {
				//수정
				response.sendRedirect("../mvcboard/edit.do?idx="+idx);
				
			}else if(mode.equals("delete")){
				//삭제
				int res = dao.delete(idx);
				
				System.out.println("res : " + res);
				
				if(res>0) {
					//삭제 성공
					JSFunction.alertLocation(response, "../MVCBoard/List.do", "삭제되었습니다.");
				}else {
					//삭제 실패
					//메시지 처리 후 이전 화면으로
					JSFunction.alertBack(response, "비밀번호 검증에 실패. 관리자 문의 요망");
				}
			}
			
		//비밀번호 체크 실패	
		}else {
			//메시지 처리 후 이전 화면으로
			JSFunction.alertBack(response, "비밀번호 검증에 실패");
		}
		
		
		
	}
	public PassController() {
		// TODO Auto-generated constructor stub
	}
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

}
