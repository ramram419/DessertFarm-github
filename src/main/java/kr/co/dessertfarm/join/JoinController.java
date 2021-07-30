package kr.co.dessertfarm.join;

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
	
	// Welcome Page after join for Manager
	@PostMapping("/joinManager")
	public String joinManager(JoinManagerRequest mreq) {
		joinSvc.managerJoin(mreq);
		return "join/main3";
	}
	
	// Move to Manager Join Form Page
	@GetMapping("/adminJoinForm")
	public String manager_join(JoinManagerRequest mreq) {
		return "admin/adminJoin";
	}
	// 
	@GetMapping("/agree")
	public String join_Agree() {
		return "home/login/join2";
	}
}
