package kr.co.dessertfarm.order;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.dessertfarm.paging.PagingDTO;
import kr.co.dessertfarm.paging.PagingService;

@Controller("Order")
public class OrderController {
	@Autowired
	private OrderService oSvc;
	
	@Autowired
	private PagingService pSvc;
	
	
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
		return "home/contents/order";
	}
	
	@RequestMapping("/order")
	public String orderPage() {
		return "order/orderpage";
	}
}
