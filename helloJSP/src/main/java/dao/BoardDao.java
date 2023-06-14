package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import common.DBConnectionPool;
import dto.Board;

public class BoardDao {

	public BoardDao() {
		// TODO Auto-generated constructor stub
	}
	/**
	 * 게시물의 총 갯수를 반환
	 * 
	 * 검색 해당 결과 건수 출력 
	 */
	public int getTotalCnt(String searchField, String search) {
		int totalCnt = 0;		
		String sql ="select count(*) from board ";
			if(searchField != null && !("").equals(searchField)) {
				sql += "where "+searchField+" like '%"+search+"%'";
			}
			sql +=	"order by num desc";
				
		try(
			Connection conn = DBConnectionPool.getConnection();	
			PreparedStatement psmt = conn.prepareStatement(sql);
			) {
			ResultSet rs = psmt.executeQuery();
			rs.next();
			totalCnt =rs.getInt(1); // 첫번째 컬럼의 값을 반환
			
			rs.close();
		} catch (SQLException e) {
			System.out.println("총 게시물의 수를 조회 하던중 예외가 발생 하였습니다.");
			e.printStackTrace();
		}
		return totalCnt;
	}
	

	/**
	 * 게시글 조회
	 * @return  List<Board>
	 * 
	 * 게시물 검색 조건 추가
	 * 
	 * searchField : 검색조건
	 * search : 검색어
	 * List<Board> : 게시글 목록
	 */
	public List<Board> getList(String searchField, String search){
		//List<Board> list = new ArrayList<Board>();
		//무슨 차이일까?
		List<Board> list = new ArrayList<>();
		
		//쿼리에 검색 조건 추가
		String sql = "select * from board ";
		
		//검색어가 입력되었으면 조건 추가
		if(search != null && !search.equals("")){
			sql  +=  "where "+searchField+" like '%"+search+"%'";
		}			
		sql += "order by num desc";
							
		/*
		String sql = "select *\r\n"
				+ "from board\r\n"
				+ "order by NUM desc";
		*/
				
		// try ( 리소스생성 ) => try문이 종료되면서 리소스를 자동으로 반납
		try(Connection conn = DBConnectionPool.getConnection();
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(sql);
			){
			/**
			 * rs.next() : resultSet(rs) 내부에는 데이터를 읽을 수 있는 커서가 있음
			 *  이게 처음에는 데이터를 읽을 수 없는 가장 앞쪽에 있어서 
			 *  한번은 rs.next()를 호출해주어야 그 다음부터 데이터를 읽을 수 있게 됩
			 */
			// 게시글의 수만큼 반복
			while(rs.next()) {
				//게시물의 한행을 DTO에 저장
				Board board = new Board();
				
				board.setNum( rs.getString("num"));
				board.setTitle(rs.getString("title"));
				board.setContent(rs.getString("content"));
				board.setId(rs.getString("id"));
				board.setVisitcount ( rs.getString("visitcount"));
				board.setPostdate ( rs.getString("postdate"));
				
				list.add(board);
			}
					
		} catch (SQLException e) {
			System.out.println("게시물 조회 중 예외 발생");
			e.printStackTrace();
		}
	
		return list;		
	}
	
		/**
		 * 게시물 검색 조건 추가
		 * 
		 * searchField : 검색조건
		 * search : 검색어
		 * List<Board> : 게시글 목록
		 
				
		public List<Board> getList(String searchField, String search){
			List<Board> list = new ArrayList<Board>();
			
			String sql = "select * from board";
			
			//검색어가 입력되었으면 조건 추가
			if(search != null && !search.equals("")){
				sql  +=  "where "+searchField+" like '%"+search+"%'";
			}			
			sql += "order by num desc";
						
			return list;

		}
		*/
	
		/**
		 * 게시물 등록
		 * int 반환 이유 : 결과값 건수를 반환하기 때문에
		 * @return res
		 * 
		 * 메서드 호출 방법 까먹음
		 */
		public int insert(Board board) {
			int res =0;
			
			String sql = "insert into board"
					+ " (num, title, content, id, postdate, visitcount)"
					+ "	values (seq_board_num.nextval, ?, ?, ?, sysdate, 0)";
			
			//try의 괄호 내부에는 close()로 자원 반납가능한 객체들만 들어올 수 있음
			try(Connection conn = DBConnectionPool.getConnection();						
					PreparedStatement psmt = conn.prepareStatement(sql);) {
				
				psmt.setString(1, board.getTitle());
				psmt.setString(2, board.getContent());
				psmt.setString(3, board.getId());
				
				//insert, update, delete 실행 후 몇 건이 처리되었는지 반환
				res = psmt.executeUpdate();

				} catch (SQLException e) {

					e.printStackTrace();
				}
				return res;
		}
		
		/*
		 * 게시글 번호를 입력받아 게시글 조회  
		 * */
		
		public Board selectOne(String num) {			
			Board board= new Board();			
			String sql =   "select * from board where num = ?";

			if(num == null || "".equals(num)) {
				return null;
			}
			
			try(Connection conn = DBConnectionPool.getConnection();
				PreparedStatement psmt = conn.prepareStatement(sql);) {
				psmt.setString(1, num);
				
				ResultSet rs = psmt.executeQuery();
				
				if(rs.next()) {
					board = new Board();
					board.setNum(rs.getString("num"));
					board.setTitle(rs.getString("title"));
					board.setContent(rs.getString("content"));
					board.setId(rs.getString("id"));
					board.setPostdate(rs.getString("postdate"));
					board.setVisitcount(rs.getString("visitcount"));

				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return board;
		}
		
		
		/*
		 * 조회수 1증가
		 * */
		public int updateVisitCount(String num) {
			int res = 0;
			String sql = "update board set visitcount = visitcount+1 where num= ?";			
			
			try(Connection conn = DBConnectionPool.getConnection();
				PreparedStatement psmt = conn.prepareStatement(sql);) {
				
				psmt.setString(1, num);
				
				res = psmt.executeUpdate();										
					
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return res;
		}
		
}