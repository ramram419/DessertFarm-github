package kr.co.dessertfarm.product;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import org.springframework.web.multipart.MultipartFile;

@Controller
public class ProductController {
	@Autowired
	public ProductService pSvc;
	
	private String keyword;
	
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
	
	// ajax Test
	@RequestMapping("/ajaxTestPage")
	public String ajaxTestPage() {
		return "test/ajaxTest";
	}
	
	@RequestMapping("/pagingTest")
	public String pagingTestPage() {
		return "test/pagingTest";
	}
	
	@ResponseBody
	@PostMapping("/admin/product/loadProductList")
	public List<ManageProductDTO> loadProductList(HttpServletRequest request) {
		
		System.out.println("loadProductList ����");
		HttpSession session = request.getSession();
		Map<String,Object> admin = (Map<String,Object>)session.getAttribute("admin");
		List<ManageProductDTO> productList = pSvc.getManage(admin.get("manager_id").toString());
		
		return productList;
		
	}
	
	@ResponseBody
	@PostMapping(value = "/admin/product/deleteProductList", produces="application/json; charset=UTF-8")
	public String deleteProductList(@RequestParam(value="checkBoxArr[]") List<String> checkBoxArr,HttpServletRequest request) {
		try {
		pSvc.deleteProduct(checkBoxArr,request);
		return "deleted Successfuuly";
		} catch (Exception e) {
			e.printStackTrace();
			return "deleted Failed";
		}
	}
	
//	@ResponseBody
//	@RequestMapping("/search")
//	public List<ManageProductDTO> searchList(HttpServletRequest req, String keyword) {
//		keyword = req.getParameter("keyword");
//		List<ManageProductDTO> searchList = pSvc.searchList(keyword);
//		System.out.println("<Controller> SearchList : " + searchList + " Keyword : " + keyword);
//		return searchList;
//	}
	
	@RequestMapping("/search")
	public String search(HttpServletRequest req, String keyword, Model model) {
		keyword = req.getParameter("keyword");
		List<ManageProductDTO> searchList = pSvc.searchList(keyword);
		System.out.println("<Controller> SearchList : " + searchList + " Keyword : " + keyword);
		model.addAttribute("searchList", searchList);
		return "home/contents/searchResult";
	}
	
	@RequestMapping("/search/searchResult")
	public String searchResult() {
		return "home/contents/searchResult";
	}
}
