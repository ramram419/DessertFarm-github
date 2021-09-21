package kr.co.dessertfarm.order;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.function.Function;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.dessertfarm.paging.PagingDTO;
import kr.co.dessertfarm.paging.PagingService;

@Controller("Order")
public class OrderController {
	@Autowired
	private OrderService oSvc;
	
	@Autowired
	private PagingService pSvc;
	
	
	@RequestMapping("/order")
	public String orderPage() {
		return "order/orderpage";
	}
	
	@RequestMapping("/orderlist")
	public String orderlist(HttpServletRequest req, HttpSession session, String id, Model model) {
		Integer pageNum = null;
		if (req.getParameter("pageNum") == null)
			pageNum = 1;
		else {
			pageNum = Integer.parseInt((req.getParameter("pageNum")));
		}
		Map<String, Object> user = new HashMap<String, Object>();
		user = (Map<String, Object>)session.getAttribute("user");
		id = user.get("client_id").toString();
		List<OrderDTO> orderList = oSvc.orderList(pageNum, id);
		PagingDTO pDTO = pSvc.orderPaging(pageNum, pSvc.getTotalOrder(id));
		model.addAttribute("orderList", orderList);
		model.addAttribute("paging", pDTO);
		return "order/orderHistory";
	}
	
	@ResponseBody
	@PostMapping("/order/send/detail")
	public int orderSend(HttpSession session, HttpServletRequest req, OrderDTO orderDTO, Model model, String order_send, String id) {
		int result = 0;
		Map<String, Object> user = new HashMap<String, Object>();
		user = (Map<String, Object>)session.getAttribute("user");
		id = user.get("client_id").toString();
		String product_name = req.getParameter("product_name");
		System.out.println("<Controller> product_name : " + product_name);
		order_send = oSvc.orderSend(id, product_name);
		if(!order_send.equals("") || order_send != null) {
			model.addAttribute("order_send", order_send);
			result = 1;
			System.out.println("Result : " + result);
			return result;
		}else {
			System.out.println("Result : " + result);
			return result;
		}
	}
	
	@RequestMapping("/order/send/detail")
	public String orderPopUp() {
		return "order/order_send";
	}
}
