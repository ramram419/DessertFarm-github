package kr.co.dessertfarm.front;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FrontController {
	@RequestMapping("/register")
	public String moveToJoin() {
		return "home/login/joinform";
	}
	
	@RequestMapping("/welcome")
	public String addmem() {
		return "home/login/Finregister";
	}
}
