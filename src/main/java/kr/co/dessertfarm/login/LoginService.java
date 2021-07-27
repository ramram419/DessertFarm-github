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
	
	public boolean isAdmin(ManagerRequest mreq) {
		List<String> result = mainDAO.managerLogin(mreq.getManager_id(), mreq.getManager_pwd());
		boolean isadmin = !result.isEmpty();
		System.out.println(isadmin);
		return isadmin;
	}
}
