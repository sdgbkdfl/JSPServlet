package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.DBConnectionPool;
import dto.Board;
import dto.Criteria;

public class BoardDao {

	public BoardDao() {
		// TODO Auto-generated constructor stub
	}
	/**
	 * 게시물의 총 갯수를 반환
	 * 
	 * 검색 해당 결과 건수 출력 
	 */
	public int getTotalCnt(Criteria criteria) {
		int totalCnt = 0;		
		String sql ="select count(*) from board ";
			if(criteria.getSearchField() != null && !("").equals(criteria.getSearchWord())) {
				sql += "where "+criteria.getSearchField()+" like '%"+criteria.getSearchWord()+"%'";
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
			System.out.println("총 게시물의 수를 조회하던 중 예외가 발생 하였습니다.");
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
	public List<Board> getList(String searchField, String searchWord){
		//List<Board> list = new ArrayList<Board>();
		//무슨 차이일까?
		List<Board> list = new ArrayList<>();
		
		//쿼리에 검색 조건 추가
		String sql = "select * from board ";
		
		//검색어가 입력되었으면 조건 추가
		if(searchWord != null && !searchWord.equals("")){
			sql  +=  "where "+searchField+" like '%"+searchWord+"%'";
		}			
		sql += "order by num desc";
							
		/*
		String sql = "select *\r\n"
				+ "from board\r\n"
				+ "order by NUM desc";
		*/
		//검색조건 추가		
		// try ( 리소스생성 ) => try문이 종료되면서 리소스를 자동으로 반납
		try(Connection conn = DBConnectionPool.getConnection();
			PreparedStatement psmt = conn.prepareStatement(sql);){
			ResultSet rs = psmt.executeQuery();
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
				//el사용할때 줄바꿈처리를 서버에서 완료하여 가져옴
				board.setContent(rs.getString("content").replace("\r\n", "<br/>"));
				board.setId(rs.getString("id"));
				board.setVisitcount ( rs.getString("visitcount"));
				board.setPostdate ( rs.getString("postdate"));
				
				list.add(board); //결과목록에 저장
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
		 * 
		 */
		public int insert(Board board) {
			int res =0;
			
			String sql = "insert into board"
					+ " (num, title, content, id, postdate, visitcount)"
					+ "	values (seq_board_num.nextval, ?, ?, ?, sysdate, 0)";
			
			//try의 괄호 내부에는 close()로 자원 반납가능한 객체들만 들어올 수 있음
			try(Connection conn = DBConnectionPool.getConnection();						
					PreparedStatement psmt = conn.prepareStatement(sql);) {
			
				//psmt.setString() 메소드를 사용하여 
				//board 객체의 제목, 내용, 사용자 ID를 SQL 문에 설정
				psmt.setString(1, board.getTitle());
				psmt.setString(2, board.getContent());
				psmt.setString(3, board.getId());
				
				//psmt.executeUpdate() 메소드를 호출하여 
				//SQL 문을 실행하고, 처리된 레코드의 수를 반환
				//insert, update, delete 실행 후 몇 건이 처리되었는지 반환
				res = psmt.executeUpdate();

				} catch (SQLException e) {

					e.printStackTrace();
				}
				return res;
		}
		
		/*
		 * 게시글 번호를 DB와 매핑하여 
		 * 게시글 상세 정보 조회  
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
		/*
		//게시글 수정(혼자 해본거)
		public int modify(String num, String title, String content) {
		String sql = "update board set title = ?, content=? where num=?";
		int res =0;
		Board board= new Board();
		
		try(Connection conn = DBConnectionPool.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);) {
			pstmt.setString(1, board.getNum());
			pstmt.setString(2, board.getTitle());
			pstmt.setString(3, board.getContent());
			
			//insert, update, delete 실행 후 몇 건이 처리되었는지 반환
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return -1;
		}*/
		
		/*
		 * 게시판 수정	
		 */
		public int update(Board board) {
			int res =0;
			
			String sql = "update board set title = ?, content=? where num=?";
					
			
			try(Connection conn = DBConnectionPool.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);) {
				
				pstmt.setString(1, board.getTitle());
				pstmt.setString(2, board.getContent());
				pstmt.setString(3, board.getNum());
				
				res= pstmt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return res;
		}
		/*
		 * 게시물 삭제하기
		 */
		public int deletePost(String num) {
			int res =0;
			String sql = "delete board where num=?";
			
			
			try(Connection conn = DBConnectionPool.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);) {
				
				pstmt.setString(1, num);
				
				//성공할 경우 0 이상의 숫자를 반환
				return pstmt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return res;			
		}
		
		/*
		 * 검색조건에 따라
		 * 게시물 목록 조회
		 */
		public List<Board> getListPage(Criteria criteria){
			//List<Board> list = new ArrayList<Board>();
			//무슨 차이일까?
			List<Board> list = new ArrayList<>();
			
			//쿼리에 검색 조건 추가
			//rownum :일련번호
			String sql =  ""
					+ "select * from ("
					+ "    select rownum rn, t.*  from ("
					
					+ "select *"
						+ "from board ";

			
			//검색어가 입력되었으면 조건 추가
			if(criteria.getSearchWord() != null && !"".equals(criteria.getSearchWord())){
				sql  +=  " where " + criteria.getSearchField() + " like '%"+criteria.getSearchWord()+"%'";
			}			
			sql += " order by num desc"
					+ ")t )" 
					+ " where rn between "+ criteria.getStartNo()
					+ " and "+ criteria.getEndNo();			
					
			// try ( 리소스생성 ) => try문이 종료되면서 리소스를 자동으로 반납
			try(Connection conn = DBConnectionPool.getConnection();
				PreparedStatement psmt = conn.prepareStatement(sql);
					){
					ResultSet rs = psmt.executeQuery();
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
					
					list.add(board); //결과 목록에 저장
				}
						
			} catch (SQLException e) {
				System.out.println("게시물 조회 중 예외 발생");
				e.printStackTrace();
			}
		
			return list;		
		}
}