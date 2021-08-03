package kr.co.dessertfarm.spring;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.dessertfarm.login.LoginRequest;

@Repository("DAO")
public class MainDAO {

	@Inject
	private SqlSession sqlSession;
	
	public Map<String, Object> client_login(LoginRequest req, String id, String pwd) {
		id = req.getClient_id();
		pwd = req.getClient_pwd();
		Map<String, String> param = new HashMap<String, String>();
		param.put("id", id);
		param.put("pwd", pwd);
		Map<String, Object> client = sqlSession.selectMap("member.client_Login", param, "");
		System.out.println("client table : " + client);
		return client;
	}
	
	public Map<String, Object> manager_login(LoginRequest req, String id, String pwd) {
		id = req.getClient_id();
		pwd = req.getClient_pwd();
		Map<String, String> param = new HashMap<String, String>();
		param.put("id", id);
		param.put("pwd", pwd);
		Map<String, Object> manager = sqlSession.selectMap("member.manager_Login", param, "");
		System.out.println("manager table : " + manager);
		return manager;
	}
}
