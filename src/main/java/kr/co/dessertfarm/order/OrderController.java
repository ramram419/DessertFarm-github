package kr.co.dessertfarm.order;

import java.util.ArrayList;
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
	public String orderPage(HttpServletRequest req, HttpSession session, Model model) {
		Map<String, Object> user = new HashMap<String, Object>();
		user = (Map<String, Object>)session.getAttribute("user");
		model.addAttribute("user", user);
		return "order/orderpage";
	}
	
	@RequestMapping("/orderlist")
	public String orderlist(HttpServletRequest req, HttpSession session, String id, Model model) throws Exception{
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
	
	@RequestMapping("/orderlist/register")
	public String reg_orderList(HttpServletRequest req, HttpSession session, String id) throws Exception {
		OrderDTO oDTO = new OrderDTO();
		Map<String, Object> user = new HashMap<String, Object>();
		user = (Map<String, Object>)session.getAttribute("user");
		id = user.get("client_id").toString();
		oDTO.setClient_id(id);
		oDTO.setProduct_name(req.getParameter("product_name"));
		oDTO.setProduct_quan(Integer.parseInt(req.getParameter("product_quan")));
		oDTO.setProduct_price(Integer.parseInt(req.getParameter("product_price")));
		oSvc.insertOrder(oDTO);
		return "order/orderpage";
	}
	
	@ResponseBody
	@PostMapping(value="/order/send/detail", produces = "application/text; charset=utf8")
	public String orderSend(HttpSession session, HttpServletRequest req, Model model,  String id) throws Exception{
		Map<String, Object> user = new HashMap<String, Object>();
		user = (Map<String, Object>)session.getAttribute("user");
		id = user.get("client_id").toString();
		String order_send = null;
		
		String result = "";
		
		String product_name = req.getParameter("product_name");
		System.out.println("<Controller> product_name : " + product_name);
		
		String order_date = req.getParameter("order_date");
		System.out.println("<Controller> order_date : " + order_date);
		
		String order_detid = oSvc.orderDetId(id, product_name, order_date);
		System.out.println("<Controller> order_detid : " + order_detid);
		
		order_send = oSvc.orderSend(id, product_name, order_date, order_detid);
		
		if(order_send != null) {
			result = order_send;
			System.out.println("<Controller> Success order_send : " + order_send);
			return result;
		}else if(order_send == null) {
			result = "null data";
			System.out.println("<Controller> Failed order_send : " + order_send);
			return result;
		}else {
			return "";
		}
	}
	
	@RequestMapping(value="/order/send/detail/popUp", produces = "application/text; charset=utf8")
	public String orderPopUp() throws Exception{
		return "order/order_send";
	}	
}
