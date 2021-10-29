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

import com.amazonaws.services.fsx.model.FileSystemMaintenanceOperation;

import kr.co.dessertfarm.basket.BasketService;
import kr.co.dessertfarm.paging.PagingDTO;
import kr.co.dessertfarm.paging.PagingService;

@Controller("Order")
public class OrderController {
	@Autowired
	private OrderService oSvc;
	
	@Autowired
	private PagingService pSvc;
	
	@Autowired
	private BasketService bSvc;
	
	@RequestMapping("/order")
	public String orderPage() {
		return "order/orderpage";
	}
	
	@RequestMapping("/bag/order")
	public String bagToOrder(HttpServletRequest req, HttpSession session, Model model) throws Exception{
		Map<String, Object> user = new HashMap<String, Object>();
		user = (Map<String, Object>)session.getAttribute("user");
		
		String pdname = req.getParameter("pdname");
		String[] pdnameArr = pdname.split(",");
		
		String pdquan = req.getParameter("pdquan");
		String[] pdquanArr = pdquan.split(",");
		
		String pdprice = req.getParameter("pdprice");
		String[] pdpriceArr = pdprice.split(",");

		for(String s : pdnameArr) {
			System.out.println("<Controller> pdname : " + s);	
		}
		for(String t : pdquanArr) {
			System.out.println("<Controller> pdquan : " + t);
		}
		for(String r : pdpriceArr) {
			System.out.println("<Controller> pdprice : " + r);
		}
		
		ArrayList<HashMap<String, String>> pdList = new ArrayList<HashMap<String, String>>();
		
		for(int i=0;i<pdnameArr.length;i++) {
			HashMap<String, String> pd = new HashMap<String, String>();
			
			pd.put("name", pdnameArr[i]);
			pd.put("quan", pdquanArr[i]);
			pd.put("price", pdpriceArr[i]);
			
			pdList.add(pd);
		}
		System.out.println("<Controller> pdList : " + pdList);
		model.addAttribute("user", user);
		model.addAttribute("pdList", pdList);
		
		List<String> orderInfo = new ArrayList<String>();
		orderInfo = oSvc.orderInfo(user.get("client_id").toString());
		System.out.println("<Controller> orderInfo : " + orderInfo);
		model.addAttribute("orderInfo", orderInfo);
		
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
		
		String pdname = req.getParameter("pdname");
		String[] pdnameArr = pdname.split(",");
		
		String pdquan = req.getParameter("pdquan");
		String[] pdquanArr = pdquan.split(",");
		
		String pdprice = req.getParameter("pdprice");
		String[] pdpriceArr = pdprice.split(",");
		
		for(int i=0;i<pdnameArr.length;i++) {
			System.out.println("<Controller> pdnameArr : " + pdnameArr[i]);
			int oid = (int)Math.random();
			
			oDTO.setClient_id(id);
			oDTO.setProduct_id(1);
			oDTO.setProduct_name(pdnameArr[i]);
			oDTO.setProduct_quan(Integer.parseInt(pdquanArr[i]));
			oDTO.setProduct_price(Integer.parseInt(pdpriceArr[i]));
			oDTO.setOrder_send("배송 준비중");
			oDTO.setOrder_id(oid);
			oDTO.setOrder_detid(Integer.toString(i));
			oDTO.setRequest("X");
			oSvc.insertOrder(oDTO);
			bSvc.deleteAfterOrder(id, pdnameArr[i]);
		}

		return "redirect:/orderlist";
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
