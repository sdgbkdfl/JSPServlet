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

public class NewBoardDao {

	public NewBoardDao() {
		// TODO Auto-generated constructor stub
	}
		/*
		 * 게시물 조회
		 * 
		 */
		public List<Board> getList(Criteria criteria){
			 List<Board> list = new ArrayList<>();
			 //Criteria criteria = new Criteria(searchField, searchWord);
			 
			String sql = "SELECT num, title, content, id,postdate, visitcount,"
						+ "        decode(TRUNC(SYSDATE),TRUNC(postdate),"
						+ "        to_Char(postdate,'hh24:mi:ss'),"
						+ "        to_Char(postdate,'yyyy-mm-dd')) postdate"
						+ "	from board ";
			
			//검색어가 입력된 경우 검색 조건 추가
			if(criteria.getSearchWord() != null && !"".equals(criteria.getSearchWord())) {
				sql += " where " + criteria.getSearchField() + " like '%"+criteria.getSearchWord()+"%'";
			}
			
				sql += " order by num desc";
		
			//1. 목록 가져오기 위해 커넥션 객체 생성 및 연결
			try(Connection conn = DBConnectionPool.getConnection();
				PreparedStatement psmt = conn.prepareStatement(sql);){
				ResultSet rs = psmt.executeQuery(sql);
				
				while(rs.next()) {
					//게시물의 한행을 DTO에 저장
					Board board = new Board();
					
					//쿼리 컬럼 나열된 순서대로 값 넣어주기!
					board.setNum( rs.getString("num"));
					board.setTitle(rs.getString("title"));
					board.setContent(rs.getString("content"));
					board.setId(rs.getString("id"));
					board.setVisitcount ( rs.getString("visitcount"));
					board.setPostdate ( rs.getString("postdate"));
					
					list.add(board);
				}	
			} catch (SQLException e) {
				System.out.println("게시물 조회 오류가 발생했습니다.");
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			 return list;
			 
		}
		
		/*
		 * 페이징 처리 
		 */
		public List<Board> getListPage(Criteria criteria){
			 List<Board> list = new ArrayList<>();
			 //Criteria criteria = new Criteria(searchField, searchWord);
			 
			 //rownum : 각 행에 할당된 일련번호
			String sql = "select * from( "
						+ "select rownum rn, t.* from ("
						+ "select num, title, content, id, visitcount,"
						+ "        decode(TRUNC(SYSDATE),TRUNC(postdate),"
						+ "        to_Char(postdate,'hh24:mi:ss'),"
						+ "        to_Char(postdate,'yyyy-mm-dd')) postdate"
						+ "	from board  ";
			
			//검색어가 입력된 경우 검색 조건 추가
			if(criteria.getSearchWord() != null 
					&& !"".equals(criteria.getSearchWord())) {
				sql += " where " + criteria.getSearchField() 
				+ " like '%"+criteria.getSearchWord()+"%'";
			}
			
			sql += "  order by num desc "
					+ " )t"
					+ ")"
					+ "where rn between "
					+ criteria.getStartNo()
					+" and "
					+ criteria.getEndNo();
			
			// 목록 가져오기 위해 커넥션 객체 생성 및 연결
			try(Connection conn = DBConnectionPool.getConnection();
				PreparedStatement psmt = conn.prepareStatement(sql);){
				ResultSet rs = psmt.executeQuery();
				
				while(rs.next()) {
					//게시물의 한행을 DTO에 저장
					Board board = new Board();
					
					//쿼리 컬럼 나열된 순서대로 값 넣어주기!
					board.setNum( rs.getString("num"));
					board.setTitle(rs.getString("title"));
					board.setContent(rs.getString("content"));
					board.setId(rs.getString("id"));
					board.setVisitcount ( rs.getString("visitcount"));
					board.setPostdate ( rs.getString("postdate"));
					
					list.add(board);
				}	
			} catch (SQLException e) {
				System.out.println("게시물 조회 오류가 발생했습니다.");
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			 return list; 
		}			

		/*
		 *  게시물 등록
		 */
		public int insert(Board board) {
			int res =0;
			
			String sql = "insert into board"
					+ "	values (seq_board_num.nextval, ?, ?, ?, sysdate, 0)";
			
			
			try(Connection conn = DBConnectionPool.getConnection();
				PreparedStatement psmt = conn.prepareStatement(sql);) {
				
				
				// JDBC에서 PreparedStatement에 파라미터를 설정하는 코드
				// board 객체의 title 속성 값을 
				// PreparedStatement의 첫 번째 파라미터에 문자열로 설정
				psmt.setString(1, board.getTitle());
				psmt.setString(2, board.getContent());
				psmt.setString(3, board.getId());
				
				res = psmt.executeUpdate();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return res;
		}
		/*
		 * 게시글 번호를 DB와 매핑하여 
		 * 게시글 상세 정보 조회  
		 */
		public Board selectOne(String num) {
			String sql = "select * from board where num=? ";
			Board board= null;
			
			System.out.println("num : "+num);
			try(Connection conn = DBConnectionPool.getConnection();
				PreparedStatement psmt = conn.prepareStatement(sql);) {
				
				psmt.setString(1, num);
				ResultSet rs = psmt.executeQuery();
				
				if(rs.next()) {
					board = new Board();
						
					board.setNum( rs.getString("num"));
					board.setTitle(rs.getString("title"));
					board.setContent(rs.getString("content"));
					board.setId(rs.getString("id"));
					board.setVisitcount (rs.getString("visitcount"));
					board.setPostdate (rs.getString("postdate"));		
					
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return board;
		}

		
		/*
		 * 조회수
		 */
		public void updateVisitCount(String num) {
			String sql = " update board set visitcount=visitcount+1 where num=?";
			
			
			try(Connection conn = DBConnectionPool.getConnection();
				PreparedStatement psmt = conn.prepareStatement(sql);	) {
				
				psmt.setString(1, num);
				psmt.executeUpdate();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
		/*
		 * 총 건수 조회
		 */
		public int getTotalCnt(Criteria criteria) {
			int res=0;
			String sql = "select count(*) from board ";
			
			if(criteria.getSearchWord() !=null 
					&& !"".equals(criteria.getSearchWord())) {
				sql += "where" + criteria.getSearchField()
				+ "= '%"+ criteria.getSearchWord()+"%'";			
			}

			try(Connection conn = DBConnectionPool.getConnection();
				PreparedStatement psmt = conn.prepareStatement(sql);) {
				
				ResultSet rs = psmt.executeQuery();
				
				if(rs.next()) {
					res = rs.getInt(1);
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return res;
		}
		
		
}
