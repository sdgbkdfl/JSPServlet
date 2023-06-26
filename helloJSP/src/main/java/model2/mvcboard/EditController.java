package model2.mvcboard;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.JSFunction;

@WebServlet("/mvcboard/edit.do")
public class EditController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("../MVCBoard/View.jsp").forward(request, response);

	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		MVCBoardDAO dao = new MVCBoardDAO();
		MVCBoardDTO dto = dao.selectOne(request.getParameter("idx"));
		
		int res = dao.insert(dto);
		
		System.out.println("res = " + res);
		
		if(res<0) {
			JSFunction.alertBack(response, "작성 중 오류 발생");

		}else {
			JSFunction.alertLocation(response,"../mvcboard/list.do", "작성되었습니다.");
		}
		
	}
	
	
	
	public EditController() {
		
	}

}
