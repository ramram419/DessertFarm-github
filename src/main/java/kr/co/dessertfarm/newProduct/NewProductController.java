package kr.co.dessertfarm.newProduct;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.dessertfarm.paging.PagingService;

@Controller
public class NewProductController {

	@Autowired
	NewProductService npSvc;
	
	@Autowired
	PagingService pSvc;
	
	// Load NewProduct
		@RequestMapping("/new") 
		public String loadNewProduct(@RequestParam(required=false)Integer pageNum, Model model) {
			if (pageNum == null) pageNum = 1;
			try {
				model.addAttribute("newProductList",npSvc.getNewProduct(pageNum));
				model.addAttribute("paging",pSvc.newProductPaging(pageNum, pSvc.getTotalNew()));
			} catch (Exception e) {
				e.printStackTrace();
			}
			return "home/contents/newitem";
		}
}
