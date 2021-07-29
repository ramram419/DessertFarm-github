package kr.co.dessertfarm.join;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import kr.co.dessertfarm.manager.JoinManagerRequest;


@Controller
public class JoinController {
	private JoinService joinSvc;
	
	public void setJoinService(JoinService joinSvc) {
		this.joinSvc = joinSvc;
	}
	
	// Welcome Page after join
	@PostMapping("/join")
	public String join(JoinRequest req) {
		joinSvc.join(req);
		return "join/main2";
	}
	
	// Welcome Page after join for Manager
	@PostMapping("/joinManager")
	public String joinManager(JoinManagerRequest mreq) {
		joinSvc.managerJoin(mreq);
		return "join/main3";
	}
	
	// Move to Client Join Form Page
	@GetMapping("/joinForm")
	public String client_join(JoinRequest req) {
		return "join/join";
	}
	
	// Move to Manager Join Form Page
	@GetMapping("/adminJoinForm")
	public String manager_join(JoinManagerRequest mreq) {
		return "admin/adminJoin";
	}
}
