package model2.mvcboard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.DBConnectionPool;
import dto.Criteria;

public class MVCBoardDAO  {
// Data Access Object 
// 게시물 목록 조회, 총 건수 조회
	
	public MVCBoardDAO() {

	}

	/**
	 * 게시글 목록 조회
	 * @return  List<MVCBoardDTO>
	 */
	//DTO를 담은 리스트 생성
	public List<MVCBoardDTO> getList(Criteria criteria){
		List<MVCBoardDTO> list = new ArrayList<MVCBoardDTO>();
		
		//쿼리 작성
		String sql = "select * from mvcoard ";
		
		//검색어가 NULL이 아니라면 검색기능을 추가
		 if(criteria.getSearchWord() !=null && !criteria.getSearchWord().equals("")){
			 sql += " WHERE " + criteria.getSearchField()+
				 " LIKE '%" +  criteria.getSearchWord()+"%'";
		 }
			sql += " order by idx DESC";
			
			
		try(Connection conn = DBConnectionPool.getConnection();
			PreparedStatement psmt = conn.prepareStatement(sql);){
			
			//결과집합 반환
			ResultSet rs = psmt.executeQuery();
			
			// 게시글의 수만큼 반복
			while(rs.next()) {
				//게시물의 한행을 DTO에 저장
				MVCBoardDTO dto = new MVCBoardDTO(
											rs.getString(1),
											rs.getString(2),
											rs.getString(3),
											rs.getString(4),
											rs.getString(5),
											rs.getString(6),
											rs.getString(7),
											rs.getInt(8),
											rs.getString(9),
											rs.getInt(10)
						        				);
				
				list.add(dto); //결과목록(리스트)에 저장
			}
					
		} catch (SQLException e) {
			System.out.println("게시물 조회 중 예외 발생");
			e.printStackTrace();
		}
	
		return list;		
	} 
	
	//검색조건에 따라 게시물 목록 조회 + 페이징
	public List<MVCBoardDTO> getListPage(Criteria criteria){
		List<MVCBoardDTO> list = new ArrayList<MVCBoardDTO>();
		
		//쿼리 작성
		String sql = "SELECT * FROM "
				+ " (SELECT tb.*, ROWNUM rn FROM ( "
				+ " SELECT * FROM mvcboard ";
		
		//검색어가 NULL이 아니라면 검색기능을 추가
		 if(criteria.getSearchWord() != null && !criteria.getSearchWord().equals("")){
		 sql += "WHERE " + criteria.getSearchField()+
				 " LIKE '% " +  criteria.getSearchWord()+" %' ";
		 }
			sql += " order by idx DESC "
				+" )tb ) "
				+ " WHERE rn BETWEEN ? AND ?";
			
			System.out.println("검색 sql : " + sql);
			
		try(Connection conn = DBConnectionPool.getConnection();
			PreparedStatement psmt = conn.prepareStatement(sql);){
			
			
			//페이징 처리 - 시작과 끝번호 입력
			psmt.setInt(1, criteria.getStartNo());
			psmt.setInt(2, criteria.getEndNo());
			
			//결과집합 반환
			ResultSet rs = psmt.executeQuery();
			
			// 게시글의 수만큼 반복
			while(rs.next()) {
				//게시물의 한행을 DTO에 저장
				MVCBoardDTO dto 
				= new MVCBoardDTO(
									rs.getString(1),
									rs.getString(2),
									rs.getString(3),
									rs.getString(4),
									rs.getString(5),
									rs.getString(6),
									rs.getString(7),
									rs.getInt(8),
									rs.getString(9),
									rs.getInt(10)
						         );
				
				list.add(dto); //결과목록(리스트)에 저장
			}
					
		} catch (SQLException e) {
			System.out.println("게시물 조회 중 예외 발생");
			e.printStackTrace();
		}
	
		return list;		
	}
	//게시판의 총 게시물 수 반환
	public int getTotalCnt(Criteria criteria) {
		int totalCnt = 0;		
		String sql ="select count(*) from mvcboard ";
			if(criteria.getSearchField() != null && !("").equals(criteria.getSearchWord())) {
				sql += "where "+criteria.getSearchField()+" like '%"+criteria.getSearchWord()+"%'";
			}
			sql +=	"order by idx desc";
				System.out.println("total :"+sql);
		try(
			Connection conn = DBConnectionPool.getConnection();	
			PreparedStatement psmt = conn.prepareStatement(sql);
			) {
			ResultSet rs = psmt.executeQuery();
			rs.next();
			totalCnt =rs.getInt(1); // 첫번째 컬럼의 값을 반환
			
			rs.close();
		} catch (SQLException e) {
			System.out.println("총 게시물의 수를 조회 하던중 예외가 발생하였습니다.");
			e.printStackTrace();
		}
		return totalCnt;
	}
	 // 검색 조건에 맞는 게시물 목록을 반환합니다(페이징 기능 지원).
	/*
    public List<MVCBoardDTO> selectListPage(Map<String,Object> map) {
        List<MVCBoardDTO> board = new ArrayList<MVCBoardDTO>();
        String sql = " "
                     + "SELECT * FROM ( "
                     + "    SELECT Tb.*, ROWNUM rNum FROM ( "
                     + "        SELECT * FROM mvcboard ";

        if (map.get("searchWord") != null)
        {
        	sql += " WHERE " + map.get("searchField")
                   + " LIKE '%" + map.get("searchWord") + "%' ";
        }

        sql += "        ORDER BY idx DESC "
               + "    ) Tb "
               + " ) "
               + " WHERE rNum BETWEEN ? AND ?";

        try(Connection conn = DBConnectionPool.getConnection();
            PreparedStatement psmt = conn.prepareStatement(sql);){
        	
        	
            psmt.setString(1, map.get("start").toString());
            psmt.setString(2, map.get("end").toString());
           ResultSet rs = psmt.executeQuery();

            while (rs.next()) {
                MVCBoardDTO dto = new MVCBoardDTO();

                dto.setIdx(rs.getString(1));
                dto.setName(rs.getString(2));
                dto.setTitle(rs.getString(3));
                dto.setContent(rs.getString(4));
                dto.setPostdate(rs.getString(5));
                dto.setOfile(rs.getString(6));
                dto.setSfile(rs.getString(7));
                dto.setDowncount(rs.getInt(8));
                dto.setPass(rs.getString(9));
                dto.setVisitcount(rs.getInt(10));

                board.add(dto);
            }
        }
        catch (Exception e) {
            System.out.println("게시물 조회 중 예외 발생");
            e.printStackTrace();
        }
        return board;
    }
	*/

	public MVCBoardDTO selectOne(String idx) {
		MVCBoardDTO dto = new MVCBoardDTO();
		String sql = "select * from mvcboard where idx = ?";
		
		
		 try(Connection conn = DBConnectionPool.getConnection();
				 PreparedStatement psmt = conn.prepareStatement(sql);
				 ) {
			psmt.setString(1, idx);
			
			ResultSet rs =  psmt.executeQuery();
			
			
			if(rs.next()) {
				dto.setIdx(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setContent(rs.getString(4));
				dto.setPostdate(rs.getString(5));
				dto.setOfile(rs.getString(6));
				dto.setSfile(rs.getString(7));
				dto.setDowncount(rs.getInt(8));
				dto.setPass(rs.getString(9));
				dto.setVisitcount(rs.getInt(10));
				}	
			

			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return dto;

	}

	public boolean confirmPassword(String pass, String idx) {
		boolean res = false;
		String sql = "select * from mvcboard where idx =? and pass=?";
		
		
		 try(Connection conn = DBConnectionPool.getConnection();
				 PreparedStatement psmt = conn.prepareStatement(sql); ) {
			psmt.setString(1, idx);
			psmt.setString(2, pass);
			
			ResultSet rs =  psmt.executeQuery();
			
			res = rs.next();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return res;
	}

	public int delete(String idx) {
		int res = 0;
		
		String sql = "DELETE from mvcboard where idx=?";
		
		
		 try(Connection conn = DBConnectionPool.getConnection();
				 PreparedStatement psmt = conn.prepareStatement(sql);
				 ){
				psmt.setString(1, idx);
				res = psmt.executeUpdate();
				
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return 0;
	}

	public int insert(MVCBoardDTO dto) {
		int res = 0;
		
		String sql = "insert into mvcboard (idx, name, title, content, pass, ofile, sfile)"
						+"values (seq_board_num.nextval, ?, ?, ?, ?, ?, ?)";
		
		
		 try(Connection conn = DBConnectionPool.getConnection();
				PreparedStatement psmt = conn.prepareStatement(sql); ) {
			 
			 psmt.setString(1, dto.getName());
			 psmt.setString(2, dto.getTitle());
			 psmt.setString(3, dto.getContent());
			 psmt.setString(4, dto.getPass());
			 psmt.setString(5, dto.getOfile());
			 psmt.setString(6, dto.getSfile());
			
			 res = psmt.executeUpdate();
			 
		} catch (SQLException e) {
			System.out.println("게시물 입력 중 오류 발생");
			e.printStackTrace();
		}
		
		
		return res;
	}
	/**
	 * 조회수 증가
	 * @param num
	 */
	public void updateVisitCount(String idx) {
		
		String sql = " update board set visitcount=visitcount+1 where num=?";
		
		
		try(Connection conn = DBConnectionPool.getConnection();
			PreparedStatement psmt = conn.prepareStatement(sql);	) {
			
			psmt.setString(1, idx);
			psmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	



   
}
