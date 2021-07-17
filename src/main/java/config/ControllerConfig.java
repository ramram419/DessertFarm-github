package config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import controller.HomeController;
import controller.JoinController;
import controller.LoginController;
import join.JoinService;
import login.LoginService;

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
	
	@Bean
	public HomeController homController() {
		return new HomeController();
	}
}
