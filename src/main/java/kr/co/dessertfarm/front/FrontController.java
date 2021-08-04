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
	
	@PostMapping("/welcome/client")
	public String client_join(HttpServletRequest req) {
		MainVO vo = new MainVO();
		vo.setClient_name(req.getParameter("client_name"));
		vo.setClient_id(req.getParameter("client_id"));
		vo.setClient_pwd(req.getParameter("client_pwd"));
		vo.setClient_tel(req.getParameter("client_tel"));
		joinSvc.reg_client(vo);
		System.out.println("Name : "+req.getParameter("client_name"));
		System.out.println(req.getParameter("client_id"));
		return "home/login/Finregister";
	}
	
	@PostMapping("/welcome/manager")
	public String client_manager(HttpServletRequest req) {
		MainVO vo = new MainVO();
		vo.setClient_name(req.getParameter("manager_name"));
		vo.setClient_id(req.getParameter("manager_id"));
		vo.setClient_pwd(req.getParameter("manager_pwd"));
		vo.setClient_tel(req.getParameter("manager_tel"));
		joinSvc.reg_client(vo);
		System.out.println("Name : "+req.getParameter("manager_name"));
		System.out.println(req.getParameter("manager_id"));
		return "home/login/Finregister";
	}
}
