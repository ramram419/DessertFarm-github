package kr.co.dessertfarm.front;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	@RequestMapping("/finregister")
	public String moveToFin() {
		return "home/login/Finregister";
	}
	
	@RequestMapping("/like")
	public String like() {
		return "home/contents/likelist";
	}
	
	@RequestMapping("/bags")
	public String bag() {
		return "home/contents/bag";
	}
	
	@RequestMapping("/orderlist")
	public String orderlist() {
		return "home/contents/order";
	}
	
	@RequestMapping("/qnalist")
	public String qnalist() {
		return "home/contents/QnAlist";
	}
	
	@RequestMapping("/newitem")
	public String newitem() {
		return "home/contents/newitem";
	}
	
	@RequestMapping("/category")
	public String category() {
		return "home/contents/category";
	}
	
	@RequestMapping("/best")
	public String best() {
		return "home/contents/best";
	}
	
	@RequestMapping(value = "/welcome/client", method= {RequestMethod.GET, RequestMethod.POST})
	public String client_join(HttpServletRequest req) {
		MainVO vo = new MainVO();
		vo.setClient_name(req.getParameter("client_name"));
		vo.setClient_id(req.getParameter("client_id"));
		vo.setClient_pwd(req.getParameter("client_pwd"));
		vo.setClient_tel(req.getParameter("client_tel"));
		joinSvc.reg_client(vo);
		System.out.println("Name : "+req.getParameter("client_name"));
		return "redirect:/finregister";
	}
	
	@PostMapping("/welcome/manager")
	public String client_manager(HttpServletRequest req) {
		MainVO vo = new MainVO();
		vo.setManager_name(req.getParameter("manager_name"));
		vo.setManager_id(req.getParameter("manager_id"));
		vo.setManager_pwd(req.getParameter("manager_pwd"));
		vo.setManager_tel(req.getParameter("manager_tel"));
		joinSvc.reg_manager(vo);
		System.out.println("Name : "+req.getParameter("manager_name"));
		return "redirect:/finregister";
	}
	
	@ResponseBody
	@RequestMapping("/client/dupId")
	public int client_dupId(HttpServletRequest req, String id) {
		id = req.getParameter("id");
		int result = joinSvc.client_dupId(id);
		System.out.println("<Controller> result : " + result + " ID : " + id);
		return result;
	}
	
	@ResponseBody
	@RequestMapping("/manager/dupId")
	public int manager_dupId(HttpServletRequest req, String id) {
		id = req.getParameter("id");
		int result = joinSvc.manager_dupId(id);
		System.out.println("<Controller> result : " + result + " ID : " + id);
		return result;
	}
}
