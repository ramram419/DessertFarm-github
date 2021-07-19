package login;

import java.util.List;

import spring.MainDAO;
import spring.MainVO;

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
	
	public boolean isAdmin(LoginRequest req) {
		List<MainVO> result = mainDAO.client_selectAll();
		Object id = (Object) req.getClient_id();
		Object pwd = (Object) req.getClient_pwd();
		boolean isadmin = result.contains(id) && result.contains(pwd);
		return isadmin;
	}
}
