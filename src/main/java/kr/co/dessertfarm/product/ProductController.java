package kr.co.dessertfarm.product;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProductController {
	public ProductService pSvc;
	
	public void setpSvc(ProductService pSvc) {
		this.pSvc = pSvc;
	}

	@RequestMapping("/product")
	public String moveToProduct() {
		return "product/product";
	}
}
