package kr.co.dessertfarm.front;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.dessertfarm.join.JoinRequest;
import kr.co.dessertfarm.join.JoinService;
import kr.co.dessertfarm.spring.MainVO;

@Controller
public class FrontController {
	@Inject
	private JoinService joinSvc;
	
	@RequestMapping("/register")
	public String moveToJoin() {
		return "home/login/joinform";
	}
	
	@RequestMapping("/welcome")
	public String addmem() {
		return "home/login/Finregister";
	}
	
	@RequestMapping(value = "/welcome/client", method=RequestMethod.POST)
	public String client_join(HttpServletRequest req) {
		MainVO vo = new MainVO();
		vo.setClient_name(req.getParameter("client_name"));
		vo.setClient_id(req.getParameter("client_id"));
		vo.setClient_pwd(req.getParameter("client_pwd"));
		vo.setClient_tel(req.getParameter("client_tel"));
		System.out.println("Name : "+req.getParameter("client_name"));
		System.out.println(req.getParameter("client_id"));
		return "home/login/Finregister";
	}
}
