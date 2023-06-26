package fileupload;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.DBConnectionPool;

public class FileDao {
//입력, 리스트 출력
	
	public FileDao() {
		// TODO Auto-generated constructor stub
	}
	//파일 정보 저장
	public int insertFile(FileDto dto) {
		int res = 0;
		
		String sql = "insert into myfile(idx,name,title,cate,ofile,sfile) values(seq_board_no.nextval, ?, ?, ?, ?, ?)";
		
		//conn
		try(Connection conn = DBConnectionPool.getConnection();
			PreparedStatement psmt = conn.prepareStatement(sql);) {
			//쿼리
			//쿼리실행
			psmt.setString(1, dto.getName() );
			psmt.setString(2, dto.getTitle() );
			psmt.setString(3, dto.getCate() );
			psmt.setString(4, dto.getOfile() );
			psmt.setString(5, dto.getSfile() );
			
			res = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return res;
	}
	//파일 목록 조회
	public List<FileDto> getFileList(){
		List<FileDto> list = new ArrayList<FileDto>();
		
		//쿼리 작성
		String query = "select * from myfile order by idx desc";
		
		//conn
		try(Connection conn = DBConnectionPool.getConnection();
			PreparedStatement psmt = conn.prepareStatement(query);) {
			ResultSet rs = psmt.executeQuery(); //쿼리실행
			
			while(rs.next()) { // 목록 안의 파일 수만큼 반복
				// DTO에 저장
				FileDto dto = new FileDto();
				dto.setIdx(rs.getString("idx"));
				dto.setName(rs.getString("name"));
				dto.setTitle(rs.getString("title"));
				dto.setCate(rs.getString("cate"));
				dto.setOfile(rs.getString("ofile"));
				dto.setSfile(rs.getString("sfile"));
				dto.setPostdate(rs.getString("postdate"));
				
				list.add(dto); // 목록에 추가
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
}
