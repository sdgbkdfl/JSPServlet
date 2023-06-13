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
	 */
	public int getTotalCnt() {
		int totalCnt = 0;
		
		String sql ="select count(*) from board order by num desc";
		
		try(
			Connection conn = DBConnectionPool.getConnection();	
			PreparedStatement psmt = conn.prepareStatement(sql);
			) {
			ResultSet rs = psmt.executeQuery();
			rs.next();
			totalCnt =rs.getInt(1);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
		return totalCnt;
	}
	

	/**
	 * 게시판 조회
	 * @return
	 */
	public List<Board> getList(){
		List<Board> list = new ArrayList<Board>();
		
		String sql = "select *\r\n"
				+ "from board\r\n"
				+ "order by NUM desc";
		//쿼리에 검색 조건 추가
				
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
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		return list;
		
	}
}