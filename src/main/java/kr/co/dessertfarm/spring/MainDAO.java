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
	
	// 사용자 로그인
	public Map<String, Object> client_login(LoginRequest req, String id, String pwd) {
		id = req.getClient_id();
		pwd = req.getClient_pwd();
		Map<String, String> param = new HashMap<String, String>();
		param.put("id", id);
		param.put("pwd", pwd);
		Map<String, Object> client = sqlSession.selectOne("member.client_Login", param);
		System.out.println("client table : " + client);
		return client;
	}
	
	//관리자/납품업체 로그인
	public Map<String, Object> manager_login(LoginRequest req, String id, String pwd) {
		id = req.getClient_id();
		pwd = req.getClient_pwd();
		Map<String, String> param = new HashMap<String, String>();
		param.put("id", id);
		param.put("pwd", pwd);
		Map<String, Object> manager = sqlSession.selectOne("member.manager_Login", param);
		System.out.println("manager table : " + manager);
		return manager;
	}
	
	//사용자 회원가입
	public void reg_client(MainVO vo) {
		sqlSession.insert("member.client_Join", vo);
	}
	
	//관리자/납품업체 회원가입
	public void reg_manager(MainVO vo) {
		sqlSession.insert("member.manager_Join", vo);
	}
	
	//사용자 비번 변경
	public void changePwd_client(MainVO vo) {
		sqlSession.update("member.client_ChangePwd", vo);
	}
	
	//관리자/납품엄체 비번 변경
	public void changePwd_manager(MainVO vo) {
		sqlSession.update("memeber.manager_ChangePwd", vo);
	}
	
	public int client_dupId(String id) {
		int result = sqlSession.selectOne("member.client_dupId", id);
		System.out.println("<DAO> result : " + result + " ID : " + id);
		return result;
	}
	
	public int manager_dupId(String id) {
		int result =  sqlSession.selectOne("member.manager_dupId", id);
		System.out.println("<DAO> result : " + result + " ID : " + id);
		return result;
	}
	
	public int client_dupName(String name) {
		int result = sqlSession.selectOne("member.client_dupName", name);
		System.out.println("<DAO> result : " + result + "Name : " + name);
		return result;
	}
	
	public int manager_dupName(String name) {
		int result = sqlSession.selectOne("member.manager_dupName", name);
		System.out.println("<DAO> result : " + result + "Name : " + name);
		return result;
	}
}
