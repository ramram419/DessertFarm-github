package kr.co.dessertfarm.login;


import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.dessertfarm.category.CategoryService;

@Controller
public class LoginController {
	private LoginService loginSvc;
	private LoginRequest req;
	
	@Autowired
	CategoryService cSvc;
		
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
	public String home(Model model) {
		model.addAttribute("best",cSvc.getBestProduct());
		return "home/homePage";
	}
	
	// Login Test & HomePage with Session
	@PostMapping("/home")
	public String login(LoginRequest req, HttpServletRequest request, Model model) {
		Map<String, Object> user = new HashMap<String, Object>();
		user = loginSvc.clientLogin(req);
		Map<String, Object> admin = new HashMap<String, Object>();
		admin = loginSvc.managerLogin(req);
		boolean isAdmin = loginSvc.isAdmin(req);
		HttpSession session = request.getSession();
		model.addAttribute("best",cSvc.getBestProduct());
		System.out.println(loginSvc.managerLogin(req));
		
		if(isAdmin == true && loginSvc.managerLogin(req) != null) {
			session.setAttribute("admin", admin);
			return "home/homePage";
		}else if(isAdmin == false && user.isEmpty() == false) {
			session.setAttribute("user", user);
			return "home/homePage";
		}else if(isAdmin == false && user.isEmpty() || user == null){
			model.addAttribute("msg", "비밀번호가 틀렸습니다.");
			model.addAttribute("url", "/login");
			return "home/login/logerr";
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
	
	@GetMapping("/mlogout")
	public String mlogOut(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		
		return "redirect:/login";
	}
	
	// 留덉씠�럹�씠吏� �씠�룞 �쟾�뿉 濡쒓렇�씤 �럹�씠吏� �씠�룞
	@RequestMapping("/loginMyPage")
	public String login_ToMyPage() {
		return "redirect:/login";
	}
	
	// 留덉씠�럹�씠吏� �씠�룞
	@PostMapping("/myPage")
	public String client_myPage(LoginRequest req, Model model) {
		Map<String, Object> user = new HashMap<String, Object>();
		user = loginSvc.clientLogin(req);

		if(user == null || user.isEmpty() == true) {
			model.addAttribute("msg", "비밀번호가 틀렸습니다.");
			model.addAttribute("url", "/login");
			return "home/login/logerr";
		}else if(user.isEmpty() == false) {
			System.out.println(user);
			return "home/contents/mypage";
		}else {
			return "home/homePage";
		}
	}
}
