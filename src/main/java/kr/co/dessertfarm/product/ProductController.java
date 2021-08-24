package kr.co.dessertfarm.product;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;

import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
		MultipartFile[] imgList = pSvc.combineImgList(product_thumb, product_images);
		pSvc.insertProduct(productRequest,imgList,request);

		return "redirect:manageProduct";
	}

	@RequestMapping("/product/manageProduct") 
	public String manageProduct(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession(false);
		Map<String,Object> user = (Map<String,Object>)session.getAttribute("admin");
		List<ManageProductDTO> manageProductList = pSvc.getManage(user.get("manager_id").toString());
		
		model.addAttribute("manageProductList",manageProductList);
		return "product/testmanageproduct";
	}
	
	// ajax Test
	@RequestMapping("/ajaxTestPage")
	public String ajaxTestPage() {
		return "test/ajaxTest";
	}
	
	@ResponseBody
	@PostMapping("/ajaxTest")
	public String ajaxTest(@RequestBody String testMsg) {
		System.out.println("dd");
		System.out.println(testMsg);
		return "";
	}
}


		