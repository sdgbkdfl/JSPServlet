package common;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

public class FileUtil {
	/**
	 * 파일 다운로드
	 * @param request
	 * @param response
	 * @param saveDirectory
	 */
	public static void download(HttpServletRequest request, HttpServletResponse response, String saveDirectory, String originalFileName, String saveFileName) {
		

		//업로드 파일이 저장된 경로
		//String saveDirectory = "C:/upload";
		
		// 원본 파일 이름
		//String originalFileName = request.getParameter("ofile");
		//저장된 파일 이름
		//String saveFileName = request.getParameter("sName");
		
//		syso
//		out.print("originalFileName :" + originalFileName);
//		out.print("sfileName : " + saveFileName+ "<br>");
		
		try{
			
			File file = new File(saveDirectory, saveFileName);
//			out.print("file :" + file);
			
			//파일 입력 스트림 생성
			InputStream inStream = new FileInputStream(file);

			//한글파일명 깨짐 방지
			String client = request.getHeader("User-Agent");
			
			//ie체크
			if(client.indexOf("WOW64")== -1){
				originalFileName =
						new String(originalFileName.getBytes("UTF-8"), "ISO-8859-1");
						
			}else{
				originalFileName =
						new String(originalFileName.getBytes("KSC5601"), "ISO-8859-1");
						
			}
			
			//파일 다운로드용 응답 헤더 설정
			response.reset();
			
			// 파일 다운로드 창을 띄우기 위한 콘텐츠 타입을 지정
			// octet-stream은 8비트 단위의 바이너리 데이터를 의미
			response.setContentType("application/octet-stream");
			
			// 원본파일이름으로 다운로드 받을수 있게 설정 하는 부분
			response.setHeader("Content-Disposion", "attachment; filename=\""+originalFileName+"\"");
			response.setHeader("Content-Length", " "+file.length());
			
//수정-------------------------------------------------------------------------
//			//출력스트림 초기화
//			out.clear();
//			out = pageContext.pushBody();
			
			//response 내장 객체로 부터 새로운 출력 스트림 생성
			OutputStream outStream = response.getOutputStream();
//----------------------------------------------------------------------------			
			
			//출력스트림에 파일 내용 출력
			byte b[] = new byte[(int)file.length()];
			int readBuffer = 0;
				while((readBuffer = inStream.read(b))>0){
					outStream.write(b, 0, readBuffer);
				}
				
			// 입출력스트림 닫음
			inStream.close();
			outStream.close();	
			
		}catch(FileNotFoundException e){
			//JSFunction.alertBack("파일을 찾을 수 없습니다.", out);
			JSFunction.alertBack(response, "파일을 찾을 수 없습니다.");
			
		}catch(Exception e){
			//JSFunction.alertBack("파일 다운로드 중 오류 발생", out);
			JSFunction.alertBack(response, "파일 다운로드 중 오류 발생");
		}
		
	}
	/**
	 * 파일 업로드
	 * 파일 업로드(multipart/form-data 요청) 처리
	 * @return
	 */
	public static MultipartRequest uploadFile(HttpServletRequest request,String saveDirectory, int maxPostSize) {
	
		try {
			//파일 업로드
			return new MultipartRequest(request, saveDirectory, maxPostSize, "UTF-8");
	
	
		} catch (IOException e) {
			// 업로드 실패
			e.printStackTrace();
			return null;
		}
		
		
	}
	/**
	 * 파일 삭제
	 * @param diretory
	 * @param filename
	 */
	public static void deleteFile(String diretory, String filename) {
		File file = new File(diretory + File.separator + filename);
		
		//파일이 존재하면 제거
		if(file.exists()) {
			file.delete();
		}
	}
	

	public FileUtil() {
		// TODO Auto-generated constructor stub
	}

}
