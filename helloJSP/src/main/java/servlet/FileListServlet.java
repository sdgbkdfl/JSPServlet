package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import fileupload.FileDao;
import fileupload.FileDto;

//url매핑시키고 띄움
@WebServlet("/FileUpload/FileList.do")
public class FileListServlet extends HttpServlet {

	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		FileDao dao = new FileDao();
		List<FileDto> list = dao.getFileList();
		
		
		// JSP에서 데이터를 다른 페이지 또는 컴포넌트로 전달하기 위해 사용되는 코드
		// request 객체를 통해 다른 JSP 페이지나 서블릿에서 접근
		// list라는 이름으로 다른 JSP 페이지에서 참조할 수 있음
		request.setAttribute("list", list);
		
		
		
		request.getRequestDispatcher("./FileList.jsp").forward(request, response);
		
		
		
	
	}
	public FileListServlet() {
		// TODO Auto-generated constructor stub
	}
	
	
}
