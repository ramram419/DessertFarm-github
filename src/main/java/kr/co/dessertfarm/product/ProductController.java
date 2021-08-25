package kr.co.dessertfarm.product;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class ProductController {
	@Autowired
	public ProductService pSvc;
	
	// Redirect to AdminPage
	@RequestMapping("/admin")
	public String moveToAdmin() {
		return "redirect:/admin/adminPage";
	}
	
	// Main Admin Page
	@RequestMapping("/admin/adminPage")
	public String moveToProduct() {
		return "product/testproductpage";
	}
	
	// Move to MenuList Page
	@RequestMapping("/admin/product/manageProduct") 
	public String manageProduct(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession(false);
		Map<String,Object> user = (Map<String,Object>)session.getAttribute("admin");
		List<ManageProductDTO> manageProductList = pSvc.getManage(user.get("manager_id").toString()); 
		
		model.addAttribute("manageProductList", manageProductList);
		return "product/testmanageproduct";
	}
	
	// Move to MenuRegister Page
	@RequestMapping("/product/testRegisterProduct")
	public String registerProductPage() {
		System.out.println("testRegister Invoked");
		return "product/testRegisterProduct";
	}
	
	// After Registering Menu and back to MenuList Page
	@PostMapping("/product/register")
	public String registerProduct(ProductRequest productRequest, MultipartFile product_thumb, MultipartFile[] product_images, HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		productRequest = pSvc.adjustProductRequest(productRequest, request, session);
		MultipartFile[] imgList = pSvc.combineImgList(product_thumb, product_images);
		pSvc.insertProduct(productRequest,imgList,request);
		System.out.println("<Controller> ID : " + productRequest.getProduct_name());
		return "redirect:/admin/product/manageProduct";
	}
	
	
}