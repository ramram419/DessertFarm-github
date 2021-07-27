package kr.co.dessertfarm.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import kr.co.dessertfarm.join.JoinController;
import kr.co.dessertfarm.join.JoinService;
import kr.co.dessertfarm.login.LoginController;
import kr.co.dessertfarm.login.LoginService;



@Configuration
public class ControllerConfig {
	@Autowired
	private LoginService loginSvc;
	
	@Autowired
	private JoinService joinSvc;
	
	@Bean
	public LoginController loginController() {
		LoginController loginController = new LoginController();
		loginController.setLoginService(loginSvc);
		return loginController;
	}
	
	@Bean
	public JoinController joinController() {
		JoinController joinController = new JoinController();
		joinController.setJoinService(joinSvc);
		return joinController;
	}
}
