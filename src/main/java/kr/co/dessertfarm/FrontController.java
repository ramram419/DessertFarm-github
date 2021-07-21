package kr.co.dessertfarm;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class FrontController {
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "main/main";
	}
	
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String Adminhome() {
		return "admin/main";
	}
	
}