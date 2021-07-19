package spring;

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

import lombok.NoArgsConstructor;

public class MainDAO {
	private JdbcTemplate jdbcTemplate;
	
	public MainDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

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
	
	public List<String> dupId(String id) {
		List<String> result = jdbcTemplate.query("select if(count(*) = 1, 'true', 'false') as result from han where id = ?", new RowMapper<String>() {

			@Override
			public String mapRow(ResultSet rs, int rowNum) throws SQLException {
				return rs.getString(1);
			}
			
		}, id);
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
}
