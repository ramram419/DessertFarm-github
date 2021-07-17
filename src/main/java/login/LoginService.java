package login;

import java.util.List;

import spring.MainDAO;

public class LoginService {
	private MainDAO mainDAO;
	
	public LoginService(MainDAO mainDAO) {
		this.mainDAO = mainDAO;
	}
	
	public List<String> login(LoginRequest req) {
		String id = req.getId();
		String pwd = req.getPwd();
		List<String> result = mainDAO.login(id, pwd);
		return result;
	}
}
