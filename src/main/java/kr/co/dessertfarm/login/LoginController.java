package kr.co.dessertfarm.login;


import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController {
	private LoginService loginSvc;
	private LoginRequest req;
		
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
	public String home() {
		return "home/homePage";
	}
	
	// Login Test & HomePage with Session
	@PostMapping("/home")
	public String login(LoginRequest req, HttpServletRequest request) {
		Map<String, Object> user = loginSvc.clientLogin(req);
		boolean isAdmin = loginSvc.isAdmin(req);
		HttpSession session = request.getSession();
		System.out.println(user);
		System.out.println(loginSvc.managerLogin(req));
		
		if(isAdmin == true) {
			session.setAttribute("admin", user);
			return "home/homePage";
		}else if(isAdmin == false && user.isEmpty() == false) {
			session.setAttribute("user", user);
			return "home/homePage";
		}else if(isAdmin == false && user.isEmpty()){
			return "login/logerr";
		}else if(session.getAttribute("myPage").equals("myPage")){
			return "home/contents/mypage";
		}else {
			return "home/homePage";
		}
	}
	
	// Logout Function & Back to HomePage & renewal Session
	@GetMapping("/logout")
	public String logOut(LoginRequest req, HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		
		return "redirect:/home";
	}

	
	// Move to Admin Page
	@GetMapping("/admin")
	public String moveToAdmin() {
		return "admin/adminPage";
	}
	
	// 마이페이지 이동 전에 로그인 페이지 이동
	@RequestMapping("/loginMyPage")
	public String login_ToMyPage(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.setAttribute("user", "user");
		return "redirect:/login";
	}
	
	// 마이페이지 이동
	@PostMapping("/myPage")
	public String client_myPage(LoginRequest req) {
		Map<String, Object> user = loginSvc.clientLogin(req);
		
		if(user.isEmpty() == false) {
			System.out.println(user);
			return "home/contents/mypage";
		}else if(user.isEmpty() == true) {
			return "login/logerr";
		}else {
			return "home/homePage";
		}
	}
}
