package kr.co.dessertfarm.login;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.dessertfarm.spring.MainDAO;

@Service("login")
public class LoginService {
	
	@Inject
	private MainDAO mainDAO;	
	
	public LoginService(MainDAO mainDAO) {
		this.mainDAO = mainDAO;
	}
	
	public Map<String, Object> clientLogin(LoginRequest req) {
		String id = req.getClient_id();
		String pwd = req.getClient_pwd();
		Map<String, Object> result = new HashMap<String, Object>(); 
		result = mainDAO.client_login(req, id, pwd);
		return result;
	}
	
	public Map<String, Object> managerLogin(LoginRequest req) {
		String id = req.getClient_id();
		String pwd = req.getClient_pwd();
		Map<String, Object> result = new HashMap<String, Object>(); 
		result = mainDAO.manager_login(req, id ,pwd);
		return result;
	}
	
	public boolean isAdmin(LoginRequest req) {
		boolean isadmin = false;
		
		if(clientLogin(req) == null || clientLogin(req).isEmpty() == true && managerLogin(req).isEmpty() == false) {
			isadmin = true;
		}else if(managerLogin(req) == null || clientLogin(req).isEmpty() == false && managerLogin(req).isEmpty() == true) {
			isadmin = false;
		}
		System.out.println(isadmin);
		return isadmin;
	}
}
