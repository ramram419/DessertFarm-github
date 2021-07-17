package controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import login.LoginRequest;
import login.LoginService;

@Controller
public class LoginController {
	private LoginService loginSvc;
	
	public void setLoginService(LoginService loginSvc) {
		this.loginSvc = loginSvc;
	}
	
	@RequestMapping("/login")
	public String login(LoginRequest req) {
		loginSvc.login(req);
		return "login/login";
	}
	
	@PostMapping("/main")
	public String main(LoginRequest req) {
		List<String> exist = loginSvc.login(req);
		if(exist.get(0).equals("true")) {
			return "login/welcome";
		}else if(exist.get(0).equals("false")){
			return "login/logerr";
		}else {
			return "login/main";
		}
	}
	
	@GetMapping("/main")
	public String main2() {
		return "redirect:/login";
	}
	
	@PostMapping("/welcome")
	public String welcome(LoginRequest req) {
		loginSvc.login(req);
		return "login/welcome";
	}
}
