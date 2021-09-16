package kr.co.dessertfarm.join;

import java.util.HashMap;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.dessertfarm.spring.MainDAO;
import kr.co.dessertfarm.spring.MainVO;

@Service("join")
public class JoinService {
	@Inject
	private MainDAO mainDAO;
	
	public JoinService(MainDAO mainDAO) {
		this.mainDAO = mainDAO;
	}
	
	public void reg_client(MainVO vo) {
		mainDAO.reg_client(vo);
	}
	
	public void reg_manager(MainVO vo) {
		mainDAO.reg_manager(vo);
	}
	
	public void changePwd_client(HashMap<String, Object> map) {
		System.out.println("<Service> changePwd Map : " + map);
		mainDAO.changePwd_client(map);
	}
	
	public void changePwd_Manager(MainVO vo) {
		mainDAO.changePwd_manager(vo);
	}
	
	public int client_PwdCheck(HashMap<String, Object> map) {
		return mainDAO.client_PwdCheck(map);
	}
	
	public int client_dupId(String id) {
		int result = mainDAO.client_dupId(id);
		System.out.println("<Service> result : " + result + " ID : " + id);
		return result;
	}
	
	public int manager_dupId(String id) {
		int result = mainDAO.manager_dupId(id);
		System.out.println("<Service> result : " + result + " ID : " + id);
		return result;
	}
	
	public int client_dupName(String name) {
		int result = mainDAO.client_dupName(name);
		System.out.println("<Service> result : " + result + " Name : " + name);
		return result;
	}
	
	public int manager_dupName(String name) {
		int result = mainDAO.manager_dupName(name);
		System.out.println("<Service> result : " + result + " Name : " + name);
		return result;
	}
}
