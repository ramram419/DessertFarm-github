package kr.co.dessertfarm.order;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	@PostMapping(value="/order/send/detail", produces = "application/text; charset=utf8")
	public String orderSend(HttpSession session, HttpServletRequest req, Model model, String order_send, String id) {
		Map<String, Object> user = new HashMap<String, Object>();
		user = (Map<String, Object>)session.getAttribute("user");
		id = user.get("client_id").toString();
		String product_name = req.getParameter("product_name");
		System.out.println("<Controller> product_name : " + product_name);
		String order_date = req.getParameter("order_date");
		System.out.println("<Controller> order_date : " + order_date);
		String order_detid = oSvc.orderDetId(id, product_name, order_date);
		System.out.println("<Controller> order_detid : " + order_detid);
		order_send = oSvc.orderSend(id, product_name, order_date, order_detid);
		if(order_send != null) {
			System.out.println("<Controller> order_send : " + order_send);
			return order_send;
		}else if(order_send == null) {
			order_send = "null data";
			System.out.println("<Controller> order_send : " + order_send);
			return order_send;
		}else {
			return "";
		}
	}
	
	@RequestMapping(value="/order/send/detail/popUp", produces = "application/text; charset=utf8")
	public String orderPopUp() {
		return "order/order_send";
	}
	
}
