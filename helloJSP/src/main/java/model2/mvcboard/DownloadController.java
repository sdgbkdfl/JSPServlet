package model2.mvcboard;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.FileUtil;

	/*
	 * 서블릿은 jsp와 달리 이클립스에서 바로 실행 불가
	 * 서블릿 파일이 아닌 개발자가 정한 요청명으로 
	 * 요청을 보내야 매핑된 서블릿이 실행됨
	 */
@WebServlet("/mvcboard/download.do")
public class DownloadController extends HttpServlet{
	
	@Override
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//메소드 안달아주면 기본이 get
		
		String ofile = request.getParameter("ofile");
		String sfile = request.getParameter("sfile");
		
		System.out.println(request.getParameter("ofile"));
		System.out.println(request.getParameter("sfile"));
		
		FileUtil.download(request, response, "C:/upload", ofile, sfile);
		}
	
	@Override
		protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		}

	public DownloadController() {

	}

}
