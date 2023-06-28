package com.library.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.library.dao.BookDao;
import com.library.vo.Book;
import com.library.vo.Criteria;
import com.library.vo.PageDto;

public class BookService {
	BookDao dao = new BookDao();
	
	/**
	 * 책 리스트를 조회 합니다.
	 * @return
	 */
//	public List<Book> getList(){
//		List<Book> list = dao.getList();
//		for(Book book : list) {
//			System.out.println(book);
//		}
//		return list;
//	}

	/**
	 * 도서 정보 입력
	 */
	public int insert(Book book) {

		int res = dao.insert(book);
	
//		if(res > 0) {
//			System.out.println(res + "건 입력 되었습니다.");
//		} else {
//			System.err.println("입력 중 오류가 발생 하였습니다.");
//			System.err.println("관리자에게 문의해주세요");
//		}
		return res;
	}
	
	
	/**
	 * 도서 삭제
	 * @param noStr
	 * @return
	 */
	public int delete(String noStr) {
		int res = dao.delete(noStr);
//		if(res > 0) {
//			System.out.println(res+"건 삭제되었습니다.");
//		} else {
//			System.err.println("삭제 중 오류가 발생 하였습니다.");
//			System.err.println("관리자에게 문의 해주세요");
//		}
		return res;
	}

	public int rentBook(Book book) {
		BookDao dao = new BookDao();
		int res = dao.rentBook(book);
		return res;
		
	}

	public void returnBook(int bookNo) {
		// 반납가능한 도서인지 확인
		String rentYN = dao.getRentYN(bookNo);
		if("N".equals(rentYN)) {
			System.err.println("반납 가능한 상태가 아닙니다.");
		} else if ("".equals(rentYN)) {
			System.out.println("없는 도서 번호 입니다.");
		}
		
		// 반납처리
		int res = dao.update(bookNo, "N");
		
		if(res>0) {
			System.out.println(res + "건 반납 되었습니다.");
		}else {
			System.out.println("반납 처리 중 오류가 발생 하였습니다.");
			System.out.println("관리자에게 문의 해주세요");
		}
	}

	/**
	 * 책 리스트 조회
	 * @param criteria
	 * @return
	 */
	public Map<String, Object> getList(Criteria criteria) {
		
		Map<String, Object> map = new HashMap<>();
		
		//리스트 조회
		List<Book> list = dao.getListPage(criteria);
		
		//총건수
		int totalcount = dao.getTotalCnt(criteria);
		
		//페이지 DTO
		PageDto pagedto = new PageDto(totalcount, criteria);
		System.out.println(list);
		System.out.println(totalcount);
		System.out.println(pagedto);
		map.put("list",list );
		map.put("totalcount",totalcount );
		map.put("pagedto",pagedto );
		System.out.println(pagedto.getStartNo());
		System.out.println(pagedto.getEndNo());
		return map;
	}


	public Book selectOne(String no) {
		BookDao dao = new BookDao();
		Book book = dao.selectOne(no);
		return book;
	}
	
}













