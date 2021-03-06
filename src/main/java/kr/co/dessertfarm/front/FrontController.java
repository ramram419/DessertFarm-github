package kr.co.dessertfarm.front;

import java.util.HashMap;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
  
	/*@RequestMapping("/new")
	public String newitem() {
		return "home/contents/newitem";
	}*/
	
	@RequestMapping("/sale")
	public String saleitem() {
		return "home/contents/sale";
	}

	/*@RequestMapping("/best")
	public String best() {
		return "home/contents/best";
	}*/
  
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
	
	@ResponseBody
	@RequestMapping("/client/dupName")
	public int clinet_dupName(HttpServletRequest req, String name) {
		name = req.getParameter("name");
		int result = joinSvc.client_dupName(name);
		System.out.println("<Controller> result : " + result + " Name : " + name);
		return result;
	}
	
	@ResponseBody
	@RequestMapping("/manager/dupName")
	public int manager_dupName(HttpServletRequest req, String name) {
		name = req.getParameter("name");
		int result = joinSvc.manager_dupName(name);
		System.out.println("<Controller> result : " + result + " Name : " + name);
		return result;
	}
	
	@ResponseBody
	@RequestMapping("/user/dupName")
	public int user_dupName(HttpServletRequest req, String name) {
		name = req.getParameter("name");
		int result = joinSvc.client_dupId(name);
		System.out.println("<Controller> result : " + result + " Name : " + name);
		return result;
	}
	
	@ResponseBody
	@RequestMapping("/modify/client")
	public int changePwd_client(HttpServletRequest req, @RequestParam(value = "client_name", required=false) String client_name, @RequestParam(value="origin_pwd", required=false) String origin_pwd, @RequestParam(value="client_pwd", required=false) String client_pwd, @RequestParam(value="client_tel", required=false) String client_tel, @RequestParam(value="client_id", required=false) String client_id) {
		HashMap<String ,Object> checkMap = new HashMap<String, Object>();
		checkMap.put("id", client_id);
		checkMap.put("pwd", origin_pwd);
		System.out.println("<Controller> checkMap : " + client_id + " " + origin_pwd);
		int result = joinSvc.client_PwdCheck(checkMap);
		System.out.println("<Controller> checkResult : " + result);
		if(result == 0) {
			return result;
		}else if(result > 0) {
			HashMap<String, Object> changeMap = new HashMap<String, Object>();
			changeMap.put("new_name", client_name);
			changeMap.put("new_pwd", client_pwd);
			changeMap.put("tel", client_tel);
			changeMap.put("id", client_id);
			joinSvc.changePwd_client(changeMap);
			System.out.println("<Controller> name : " + client_name);
			System.out.println("<Controller> newPwd : " + client_pwd);
			System.out.println("<Controller> tel : " + client_tel);
			System.out.println("<Controller> id : " + client_id);
			return result;
		}else {
			return -1;
		}
		
	}
}
