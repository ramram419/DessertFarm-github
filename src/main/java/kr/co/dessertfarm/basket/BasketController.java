package kr.co.dessertfarm.basket;

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

@Controller("Basket")
public class BasketController {
	
	@Autowired
	private BasketService bSvc;
	
	@Autowired
	private PagingService pSvc;
	
	@RequestMapping("/bags")
	public String basket(HttpServletRequest req, HttpSession session, Model model, String id){
		Integer pageNum = null;
		if (req.getParameter("pageNum") == null)
			pageNum = 1;
		else {
			pageNum = Integer.parseInt((req.getParameter("pageNum")));
		}
		Map<String, Object> user = new HashMap<String, Object>();
		user = (Map<String, Object>)session.getAttribute("user");
		id = user.get("client_id").toString();
		List<BasketDTO> basketList = bSvc.selectBasket(pageNum, id);
		PagingDTO pDTO = pSvc.basketPaging(pageNum, pSvc.getTotalBasket(id));
		model.addAttribute("basketList", basketList);
		model.addAttribute("paging", pDTO);
		return "home/contents/bag";
	}
}
