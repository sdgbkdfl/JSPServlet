package model2.mvcboard;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.JSFunction;

@WebServlet("/mvcboard/view.do")
public class ViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;	
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//게시물 조회 
		MVCBoardDAO dao = new MVCBoardDAO();
		MVCBoardDTO dto = dao.selectOne(request.getParameter("idx"));
		
		//조회된 게시물 저장(request 영역)
		request.setAttribute("dto", dto);
		
		
		//view.jsp페이지로 포워딩
		request.getRequestDispatcher("../MVCBoard/View.jsp").forward(request, response);
		
		
		//------------조회수 카운트
		String idx = request.getParameter("idx");

		if(idx == null){
			JSFunction.alertBack(response,"존재하지 않는 게시물 입니다.");
			return;
		}
		dao.updateVisitCount(idx);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}
	

	public ViewController() {
		// TODO Auto-generated constructor stub
	}

}
