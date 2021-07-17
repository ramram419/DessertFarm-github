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

public class MainDAO {
	private JdbcTemplate jdbcTemplate;
	
	public MainDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	public List<String> login(String id, String password) {
		List<String> result = jdbcTemplate.query("select if(count(*) = 1, 'true', 'false') as result from han where id = ? and pwd = ?", new RowMapper<String>() {

			@Override
			public String mapRow(ResultSet rs, int rowNum) throws SQLException {
				return rs.getString(1);
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
	
	public void insert(MainVO mainVO) {
		jdbcTemplate.update(new PreparedStatementCreator() {
			
			@Override
			public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
				PreparedStatement pstmt = con.prepareStatement("insert into han (id, pwd, name, email, joinDate) values (?, ?, ?, ?, ?)");
				pstmt.setString(1, mainVO.getId());
				pstmt.setString(2, mainVO.getPwd());
				pstmt.setString(3, mainVO.getName());
				pstmt.setString(4, mainVO.getEmail());
				pstmt.setDate(5, mainVO.getJoinDate());
				return pstmt;
			}
		});
	}
}
