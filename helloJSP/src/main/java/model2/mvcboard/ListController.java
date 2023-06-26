package model2.mvcboard;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.Criteria;
import dto.PageDto;

public class ListController extends HttpServlet {

@Override //doGet( ) 메서드를 오버라이드
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	
	//리스트 조회(dao 객체 생성)
	MVCBoardDAO dao = new MVCBoardDAO();

//	int pageNo = 1;
//	if(request.getParameter("pageNo") !=null) {
//		try {
//			pageNo = Integer.parseInt(request.getParameter("pageNo"));
//			
//		} catch (Exception e) {
//			System.out.println("페이지 번호를 숫자로 변환 중 오류 발생");
//			
//		}
//	}
	
	// 검색어, 페이지정보 셋팅
	String searchField = request.getParameter("searchField");
	String searchWord = request.getParameter("searchWord");
	String pageNo = request.getParameter("pageNo");
	
	
	// criteria에 searchField,searchWord를 매개변수로 넣어줘야함
	Criteria criteria = new Criteria(searchField, searchWord, pageNo);
	
	//System.out.println("페이지 관련 파라메터");
	System.out.println(criteria.getSearchWord());
	
	
	//뷰에 전달할 매개변수 저장용 맵 생성
	//Map<String, Object> map = new HashMap<String, Object>();
//	
//	criteria.setSearchField(request.getParameter("searchField"));
//	criteria.setSearchWord(request.getParameter("searchWord"));
	
	//검색 정보를 담은 객체를 매개변수로 넣어줌
	List<MVCBoardDTO> list =  dao.getListPage(criteria);
	
	int totalcount = dao.getTotalCnt(criteria);
	
	
	//페이지 네비게이션 생성을 위해 pageDto생성
	PageDto pageDto = new PageDto(totalcount, criteria);
	
	
	//request 영역에 저장
	request.setAttribute("list", list);
	request.setAttribute("totalcount", totalcount);
	request.setAttribute("pageDto", pageDto);
	
	
	//화면으로 페이지 전환
	request.getRequestDispatcher("../MVCBoard/List.jsp").forward(request, response);
	//작성 후 List.jsp 로 가서 데이터 받아 출력!
	

	
	 
//	if(searchWord != null) {
//		// 쿼리스트링으로 전달받은 매개변수 중 검색어가 있다면 map에 저장
//		map.put("searchField", searchField);
//		map.put("searchWord", searchWord);
//	}
//	int totalCount = dao.selectCount(map); // 게시물 개수
//	
//	/* 페이지 처리 start */
//	ServletContext application = getServletContext();
//	int pageSize = Integer.parseInt(application.getInitParameter("POSTS_PER_PAGE"));
//	int blockPage = Integer.parseInt(application.getInitParameter("PAGES_PER_BLOCK"));
//		
//	//현재 페이지 확인
//	int pageNum = 1; // 기본값
//	String pageTemp = request.getParameter("pageNum");
//	if(pageTemp != null && !pageTemp.equals(""))
//		pageNum = Integer.parseInt(pageTemp); //요청받은 페이지로 수정
//	
//	// 목록에 출력할 게시물 범위 계산
//	int start = (pageNum -1 ) * pageSize + 1; // 첫 게시물 번호
//	int end = pageNum * pageSize; // 마지막 게시물 번호
//	map.put("start", start);
//	map.put("end", end);
//	/* 페이지처리 end */
	
	 
	//List<MVCBoardDTO> boardLists = dao.selectListPage(map);
	// 게시물 목록 받기
	//dao.close(); 
	
	// 뷰에 전달할 매개변수 추가
//	String pagingImg = BoardPage.pagingStr(totalCount, pageSize, blockPage, pageNum, "../mvcboard/list.do");
//	map.put("pagingImg", pagingImg);
//	map.put("totalCount", totalCount);
//	map.put("pageSize", pageSize);
//	map.put("pageNum", pageNum);
	
	// 전달할 데이터를 request 영역에 저장 후 List.jsp로 포워드
	//request.setAttribute("boardLists",boardLists);
//	request.setAttribute("map",map);
//	request.getRequestDispatcher("/List.jsp").forward(request,response);
}


	
	public ListController() {
		// TODO Auto-generated constructor stub
	}

}
