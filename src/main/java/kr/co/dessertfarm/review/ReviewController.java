package kr.co.dessertfarm.review;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.dessertfarm.order.OrderService;

@Controller("Review")
public class ReviewController {
	
	@Autowired
	private ReviewService rSvc;
	
	@Autowired
	private OrderService oSvc;
	
	@RequestMapping("/review")
	public String reg_newReview(HttpServletRequest req, HttpSession sess, Model model, String id) {
		Map<String, Object> user = new HashMap<String, Object>();
		user = (Map<String, Object>)sess.getAttribute("user");
		id = user.get("client_id").toString();
		
		String order_send = req.getParameter("order_send");
		System.out.println("<Review Controller> : " + order_send);
		
		if(order_send.equals("배송 완료")) {
			return "redirect:/review/new";
		}
		else {
			return "";
		}
	}
}
