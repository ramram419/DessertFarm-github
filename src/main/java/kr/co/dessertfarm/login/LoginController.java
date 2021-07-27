package kr.co.dessertfarm.login;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.dessertfarm.manager.ManagerRequest;


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
	
	@RequestMapping("/managerLogin")
	public String moveToAdminLogin(ManagerRequest mreq) {
		return "admin/adminLogin";
	}
	
	@PostMapping("/dessertfarm.com")
	public String login(LoginRequest req, ManagerRequest mreq, HttpServletRequest request) {
		List<String> user = loginSvc.login(req);
		boolean isAdmin = loginSvc.isAdmin(mreq);
		HttpSession session = request.getSession();
		session.setAttribute("user", user);
		
		if(isAdmin == true) {
			return "admin/admin_homePage";
		}else if(isAdmin == false && !user.isEmpty()) {
			return "home/homePage-2";
		}else if(isAdmin == false && user.isEmpty()){
			return "login/logerr";
		}else {
			return "home/homePage";
		}
	}
	
	@GetMapping("/dessertfarm.com")
	public String home() {
		return "home/homePage";
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
	
	@GetMapping("/admin")
	public String moveToAdmin() {
		return "admin/adminPage";
	}
}
