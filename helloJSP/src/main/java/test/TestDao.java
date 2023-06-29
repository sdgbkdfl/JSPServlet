package test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import common.ConnectionUtil;

public class TestDao {

		//검색조건에 따라 목록 조회 + 페이징
		public List<TestDto> getListPage(test.Criteria criteria){
			List<TestDto> list = new ArrayList<TestDto>();
			
			//쿼리 작성
			String sql = "SELECT * FROM "
					+ " (SELECT tb.*, ROWNUM rn FROM ( "
					+ " SELECT * FROM tmember ";
			
			//검색어가 NULL이 아니라면 검색기능을 추가
			 if(criteria.getSearchWord() != null && !criteria.getSearchWord().equals("")){
			 sql += "WHERE " + criteria.getSearchField()+
					 " LIKE '% " +  criteria.getSearchWord()+" %' ";
			 }
				sql += " order by no DESC "
					+" )tb ) "
					+ " WHERE rn BETWEEN ? AND ?";
				
				System.out.println("검색 sql : " + sql);
				
			try(Connection conn = ConnectionUtil.getConnection();
				PreparedStatement psmt = conn.prepareStatement(sql);){
			
				//페이징 처리 - 시작과 끝번호 입력
				psmt.setInt(1, criteria.getStartNo());
				psmt.setInt(2, criteria.getEndNo());
				
				//결과집합 반환
				ResultSet rs = psmt.executeQuery();
				
				// 게시글의 수만큼 반복
				while(rs.next()) {
					//게시물의 한행을 DTO에 저장
					TestDto dto 
					= new TestDto(
										rs.getString(1),
										rs.getString(2),
										rs.getString(3),
										rs.getString(4)

							         );
					
					list.add(dto); //결과목록(리스트)에 저장
				}
						
			} catch (SQLException e) {
				System.out.println("조회 중 예외 발생");
				e.printStackTrace();
			}
		
			return list;		
		}	
		
		
		
		/**
		 * 회원목록 조회
		 * @param criteria 
		 * @return
		 */
		public List<TestDto> getList(test.Criteria criteria){
			List<TestDto> list = new ArrayList<TestDto>();
			
			//String sql = "select * from book order by no";
			String sql =
					"select no, id"
					+ "    , name, adminyn "
					+ "from tmember "
					+ "order by no";
			System.out.println(sql);
			// try ( 리소스생성 ) => try문이 종료되면서 리소스를 자동으로 반납
			try (Connection conn = ConnectionUtil.getConnection();
					Statement stmt = conn.createStatement();
					
					// stmt.executeQuery : resultSet (질의한 쿼리에 대한 결과집합)
					// stmt.executeUpdate : int (몇건이 처리되었는지!!!)
					ResultSet rs = stmt.executeQuery(sql)){
				
				while(rs.next()) {
					String no = rs.getString(1);
					String id = rs.getString(2);
					String name = rs.getString(3);
					String adminyn = rs.getString(4);
					
					TestDto dto = new TestDto(no, id, name, adminyn);
					list.add(dto);
				}

			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			return list;
		}
	
	
	public int getTotalCnt(test.Criteria criteria) {
		
		int totalcount = 0;		
		
		String sql ="select count(*) from tmember ";
		
		
		if(criteria.getSearchField() != null && !("").equals(criteria.getSearchWord())) {
			sql += "where "+criteria.getSearchField()+" like '%"+criteria.getSearchWord()+"%'";
		}
		sql +=	"order by no desc";
			System.out.println("total :"+sql);
		try(
			Connection conn = ConnectionUtil.getConnection();	
			PreparedStatement psmt = conn.prepareStatement(sql);
			) {
			ResultSet rs = psmt.executeQuery();
			rs.next();
			totalcount =rs.getInt(1); // 첫번째 컬럼의 값을 반환
			
			rs.close();
			
		} catch (SQLException e) {
			System.out.println("총 게시물의 수를 조회하던 중 예외가 발생하였습니다.");
				e.printStackTrace();
			}
			return totalcount;
}
	public TestDao() {
		// TODO Auto-generated constructor stub
	}

}
