package com.util;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class cookieManager {

	public cookieManager() {
		// TODO Auto-generated constructor stub
	}
	//쿠키 메서드 만들기
	
	//이름, 값, 유지 시간을 매개변수로 받아
	//쿠키 생성 후 응답 객체에 담기
	public static void makeCookie(HttpServletResponse response, String cName, String cValue, int cTime) {
		//쿠키 생성
		Cookie cookie = new Cookie("cName",cValue);
		//경로설정
		cookie.setPath("/");
		//유지기간 설정
		cookie.setMaxAge(60*60);
		//응답객체에 추가
		response.addCookie(cookie);
	}
	
	//쿠키이름을 받아 쿠키값 반환
	public static String readCookie(HttpServletRequest request, String cName) {
		String cookieValue ="";
		
		Cookie[] cookies = request.getCookies();
		if (cookies !=null){
			//쿠키 배열을 돌면서 일치하는 이름 찾아 값 반환
			for(Cookie cookie : cookies){
				String cookieName = cookie.getName();
				if(cName.equals(cookieName)) {
					cookieValue = cookie.getValue();
					break;					
				}
			}
		}	
		
		return cookieValue;
	}

	//쿠키이름을 매개변수로 받아 삭제
	//시간을 0으로 지정
	public static void deleteCookie(HttpServletResponse response, String cName, String cValue, int cTime) {
		makeCookie(response, cName, "", 0);
	}
}
