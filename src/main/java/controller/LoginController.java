package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	public String moveToLogin(LoginRequest req) {
		return "login/login";
	}
	
	@PostMapping("/dessertfarm.com")
	public String login(LoginRequest req, HttpServletRequest request) {
		List<String> user = loginSvc.login(req);
		HttpSession session = request.getSession();
		session.setAttribute("user", user);
		
		if(!user.isEmpty()) {
			return "home/homePage-2";
		}else if(user.isEmpty()){
			return "login/logerr";
		}else {
			return "home/homePage";
		}
	}
	
	@GetMapping("/logout")
	public String logOut(LoginRequest req, HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		
		return "redirect:/dessertfarm.com";
	}
	
	@GetMapping("/main")
	public String main2() {
		return "redirect:/login";
	}
}
