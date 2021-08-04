package kr.co.dessertfarm.join;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.dessertfarm.manager.JoinManagerRequest;


@Controller
public class JoinController {
	private JoinService joinSvc;
	
	public void setJoinService(JoinService joinSvc) {
		this.joinSvc = joinSvc;
	}
	
	// Move to Client Join
	@RequestMapping("/join")
	public String moveToJoin() {
		return "home/login/join";
	}

	// 
	@GetMapping("/manager")
	public String manager_join_Agree(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:/managerJoin";
	}
	
	@GetMapping("/client")
	public String client_join_Agree(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:/clientJoin";
	}
	
	@GetMapping("/managerJoin")
	public String managerJoin(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.setAttribute("manager", "manager");
		return "home/login/join2";
	}
	
	@GetMapping("/clientJoin")
	public String clientJoin(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.setAttribute("client", "client");
		return "home/login/join2";
	}
}
