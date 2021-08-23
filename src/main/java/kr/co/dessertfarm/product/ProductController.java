package kr.co.dessertfarm.product;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class ProductController {
	@Autowired
	public ProductService pSvc;
	
	
	// 
	@RequestMapping("/product")
	public String moveToProduct() {
		return "product/testproductpage";
	}
	
	@RequestMapping("/product/testRegisterProduct")
	public String registerProductPage() {
		System.out.println("dd");
		return "product/testRegisterProduct";
	}
	
	@PostMapping("/product/register")
	public String registerProduct(ProductRequest productRequest,MultipartFile product_thumb,MultipartFile[] product_images,HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		productRequest = pSvc.adjustProductRequest(productRequest, request, session);
		pSvc.insertProduct(productRequest);
		return "";
	}
}

