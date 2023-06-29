package test;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class TestService {
	TestDao dao = new TestDao();
	
	public Map<String, Object> getList(Criteria criteria) {
		
		Map<String, Object> map = new HashMap<>();
		
		//리스트 조회
		List<TestDto> list = dao.getListPage(criteria);
		
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
	
	
	public TestService() {
		// TODO Auto-generated constructor stub
	}

}
