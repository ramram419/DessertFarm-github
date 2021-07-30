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
	
	// Login Function
	@RequestMapping("/login")
	public String moveToLogin() {
		return "home/login/login";
	}
	
	// HomePage without Session
	@GetMapping("/home")
	public String home(HttpServletRequest request) {
		return "home/homePage";
	}
	
	// Login Test & HomePage with Session
	@PostMapping("/home")
	public String login(LoginRequest req, ManagerRequest mreq, HttpServletRequest request) {
		List<String> user = loginSvc.login(req);
		boolean isAdmin = loginSvc.isAdmin(req);
		HttpSession session = request.getSession();
		
		
		if(isAdmin == true) {
			session.setAttribute("admin", user);
			return "admin/admin_homePage";
		}else if(isAdmin == false && user.isEmpty() == false) {
			session.setAttribute("user", user);
			return "home/homePage";
		}else if(isAdmin == false && user.isEmpty()){
			return "login/logerr";
		}else {
			return "home/homePage";
		}
	}
	
	// Logout Function & Back to HomePage & renewal Session
	@GetMapping("/logout")
	public String logOut(LoginRequest req, HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		
		return "redirect:/dessertfarm.com";
	}

	
	// Move to Admin Page
	@GetMapping("/admin")
	public String moveToAdmin() {
		return "admin/adminPage";
	}
}
