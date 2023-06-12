package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import common.ConnectionUtil;
import dto.Member;

public class MemberDao {

	public MemberDao() {
		
	}
	
	/**
	 * 로그인
	 * 아이디 비밀번호가 일치하는 회원 조회
	 * 회원이 존재하는 경우  Member객체 반환
	 * 존재하지 않은 경우 null반환
	 * @param id :입력한 회원id
	 * @param pw : 입력한 회원 비밀번호
	 * @return
	 */
	public Member login(String id, String pw) {
	//어떤 정보를 알고있어야 로그인 가능한지 - 매개변수로 입력
	
		Member member = null;
			
		//아이디 비밀번호로 정보 조회하는 쿼리 	
		String sql = "SELECT * from member where id=? and pass=?";
		
		
		//리소스/자원을 자동 반환(close())
		try (Connection con = ConnectionUtil.getConnection();
				PreparedStatement psmt = con.prepareStatement(sql);
			){
			
			psmt.setString(1, id);
			psmt.setString(2, pw);
			
			ResultSet rs = psmt.executeQuery();
			
			
			//아이디/비밀번호가 일치하는 회원이 있으면 조회
			if(rs.next()) {
				String loginId = rs.getString("id");
				String name = rs.getString("name");
				String regidate = rs.getString("regidate");
				member = new Member(loginId, "", name, regidate);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return member;
	}
	
	public int insert(Member member) {
		int i = 0;
		String sql= "insert inti member values(?,?,? sysdate)";
		

		try (Connection conn = ConnectionUtil.getConnection();
				PreparedStatement psmt = conn.prepareStatement(sql);){
			
			psmt.setString(1,member.getId());
			psmt.setString(1,member.getPass());
			psmt.setString(1,member.getRegidate());
			
			
			i = psmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}
}
