package login;

import java.util.List;

import spring.MainDAO;

public class LoginService {
	private MainDAO mainDAO;
	
	public LoginService(MainDAO mainDAO) {
		this.mainDAO = mainDAO;
	}
	
	public List<String> login(LoginRequest req) {
		String id = req.getClient_id();
		String pwd = req.getClient_pwd();
		List<String> result = mainDAO.login(id, pwd);
		return result;
	}
}
