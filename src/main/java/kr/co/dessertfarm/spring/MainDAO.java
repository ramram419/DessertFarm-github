package kr.co.dessertfarm.spring;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.logging.Logger;
import org.springframework.stereotype.Repository;

import kr.co.dessertfarm.join.JoinRequest;
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
	
//	public int client_Join (MainVO vo, Map<String, Object> param) {
//		param = new HashMap<String, Object>();
//		param.put("client_name", vo.getClient_name());
//		param.put("client_id", vo.getClient_id());
//		param.put("client_pwd", vo.getClient_pwd());
//		param.put("client_email", vo.getClient_email());
//		param.put("client_address", vo.getClient_address());
//		param.put("client_tel", vo.getClient_tel());
//		int succ = 0;
//		sqlSession.insert("member.client_Join", param);
//		System.out.println(succ);
//		sqlSession.commit();
//		return succ;
//	}
	
	public void reg_client(MainVO vo) {
		sqlSession.insert("member.client_Join", vo);
	}
	
	public int manager_Join (MainVO vo) {
		int succ = 0;
		Map<String, MainVO> param = new HashMap<String, MainVO>();
		param.put("manager_name", vo);
		param.put("manager_id", vo);
		param.put("manager_pwd", vo);
		param.put("manager_email", vo);
		param.put("manager_address", vo);
		param.put("manager_tel", vo);
		succ = sqlSession.insert("member.manager_Join", vo);
		System.out.println(succ);
		sqlSession.commit();
		return succ;
	}
}
