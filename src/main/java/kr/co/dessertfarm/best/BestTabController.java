package kr.co.dessertfarm.best;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BestTabController {
	
	@Autowired
	BestTabService bSvc;
	
	@RequestMapping("/best")
	public String bebe(Model model) {
		model.addAttribute("bestShopList", bSvc.getBestShop());
		model.addAttribute("bestProductList", bSvc.getBestProduct());
		return "home/contents/best";
	}
}
