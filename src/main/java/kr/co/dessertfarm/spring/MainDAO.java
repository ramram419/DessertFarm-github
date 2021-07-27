package kr.co.dessertfarm.spring;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;

public class MainDAO {
	private JdbcTemplate jdbcTemplate;
	
	public MainDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	// client 테이블에서 LoginRequest로 조회 후 "id+pwd"를 컬렉션으로 반환
	public List<String> login(String id, String password) {
		List<String> result = jdbcTemplate.query("select * from client where client_id = ? and client_pwd = ?", new RowMapper<String>() {

			@Override
			public String mapRow(ResultSet rs, int rowNum) throws SQLException {
				String admin = rs.getString(3) + rs.getString(4);
				return admin;
			}
			
		}, id, password);
		return result;
	}

	
	public List<MainVO> client_selectAll() {
		List<MainVO> result = jdbcTemplate.query("select * from client", new RowMapper<MainVO>() {

			@Override
			public MainVO mapRow(ResultSet rs, int rowNum) throws SQLException {
				MainVO mainVO = new MainVO(
					rs.getString("client_id"),
					rs.getString("client_pwd"),
					rs.getString("client_email"),
					rs.getString("client_address"),
					rs.getString("client_tel"),
					rs.getString("client_entre"),
					rs.getString("client_kakao"));
					mainVO.setClient_num(rs.getInt("client_num"));
				return mainVO;
			}
			
		});
		return result;
	}
	
	public void insert(MainVO mainVO) {
		KeyHolder keyHolder = new GeneratedKeyHolder();
		jdbcTemplate.update(new PreparedStatementCreator() {
			
			@Override
			public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
				PreparedStatement pstmt = con.prepareStatement("insert into client (client_name, client_id, client_pwd, client_email, client_address, client_tel, client_entre, client_kakao) values (?, ?, ?, ?, ?, ?, ?, ?)", new String[] {"client_num"});
				pstmt.setString(1, mainVO.getClient_name());
				pstmt.setString(2, mainVO.getClient_id());
				pstmt.setString(3, mainVO.getClient_pwd());
				pstmt.setString(4, mainVO.getClient_email());
				pstmt.setString(5, mainVO.getClient_address());
				pstmt.setString(6, mainVO.getClient_tel());
				pstmt.setString(7, mainVO.getClient_entre());
				pstmt.setString(8, mainVO.getClient_kakao());
				return pstmt;
			}
		}, keyHolder);
		Number keyValue = keyHolder.getKey();
		mainVO.setClient_num(keyValue.intValue());
	}
	
	// manager 테이블에서 ManagerRequest id,pwd로 조회 후 "num"을 컬렉션으로 반환
	public List<String> managerLogin(String id, String password) {
		List<String> result = jdbcTemplate.query("select * from manager where manager_id = ? and manager_pwd = ?", new RowMapper<String>() {

			@Override
			public String mapRow(ResultSet rs, int rowNum) throws SQLException {
				return rs.getString(1);
			}
			
		}, id, password);
		return result;
	}
	// manager 테이블에 새로운 상업자/관리자 등록
	public void managerInsert(MainVO mainVO) {
		KeyHolder keyHolder = new GeneratedKeyHolder();
		jdbcTemplate.update(new PreparedStatementCreator() {
			
			@Override
			public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
				PreparedStatement pstmt = con.prepareStatement("insert into manager (manager_name, manager_id, manager_pwd, manager_email, manager_address, manager_tel, manager_intro, manager_website, manager_image) values (?, ?, ?, ?, ?, ?, ?, ?, ?)", new String[] {"manager_num"});
				pstmt.setString(1, mainVO.getManager_name());
				pstmt.setString(2, mainVO.getManager_id());
				pstmt.setString(3, mainVO.getManager_pwd());
				pstmt.setString(4, mainVO.getManager_email());
				pstmt.setString(5, mainVO.getManager_address());
				pstmt.setString(6, mainVO.getManager_tel());
				pstmt.setString(7, mainVO.getManager_intro());
				pstmt.setString(8, mainVO.getManager_website());
				pstmt.setString(9, mainVO.getManager_image());
				return pstmt;
			}
		}, keyHolder);
		Number keyValue = keyHolder.getKey();
		mainVO.setManager_num(keyValue.intValue());
	}
	
	public void managerDelete(MainVO mainVO) {
		
	}
}
