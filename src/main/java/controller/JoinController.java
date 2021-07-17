package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import join.JoinRequest;
import join.JoinService;

@Controller
public class JoinController {
	private JoinService joinSvc;
	
	public void setJoinService(JoinService joinSvc) {
		this.joinSvc = joinSvc;
	}
	
	@PostMapping("/join")
	public String join(JoinRequest req) {
		joinSvc.join(req);
		return "join/main2";
	}
	
	@GetMapping("/joinForm")
	public String show(JoinRequest req) {
		return "join/join";
	}
}
