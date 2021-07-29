package kr.co.dessertfarm.login;

import java.util.List;

import kr.co.dessertfarm.manager.ManagerRequest;
import kr.co.dessertfarm.spring.MainDAO;
import kr.co.dessertfarm.spring.MainVO;


public class LoginService {
	private MainDAO mainDAO;
	private MainVO mainVO;
	
	public LoginService(MainDAO mainDAO) {
		this.mainDAO = mainDAO;
	}
	
	public List<String> login(LoginRequest req) {
		String id = req.getClient_id();
		String pwd = req.getClient_pwd();
		List<String> result = mainDAO.login(id, pwd);
		return result;
	}
	
	public List<String> managerLogin(LoginRequest req) {
		String id = req.getClient_id();
		String pwd = req.getClient_pwd();
		
		List<String> result = mainDAO.managerLogin(id, pwd);
		return result;
	}
	
	public boolean isAdmin(LoginRequest req) {
		boolean isadmin = false;
		
		if(login(req).isEmpty() == true && managerLogin(req).isEmpty() == false) {
			isadmin = true;
		}else if(login(req).isEmpty() == false && managerLogin(req).isEmpty() == true) {
			isadmin = false;
		}
		System.out.println(isadmin);
		return isadmin;
	}
}
