package kr.co.dessertfarm.product;

import java.io.File;
import java.nio.file.spi.FileSystemProvider;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import org.springframework.web.multipart.MultipartFile;

import com.amazonaws.AmazonClientException;
import com.amazonaws.AmazonServiceException;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.model.PutObjectRequest;
import com.amazonaws.services.s3.model.CannedAccessControlList;

import kr.co.dessertfarm.ImageManager.ImageService;
import kr.co.dessertfarm.awsTest.S3Controller;

@Controller
public class ProductController {
	
	private Logger logger = LoggerFactory.getLogger(S3Controller.class);
	
	@Autowired
	private AmazonS3 s3Client;
	
	@Value("${cloud.aws.s3.bucket}")
	private String bucket;
	
	@Autowired
	public ProductService pSvc;
	
	@Autowired
	public ImageService iSvc;
	
	@Autowired
	ProductViewService pvSvc;
	
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
	
	// ¡Ú¡Ú¡Ú After Registering Menu and back to MenuList Page
	@PostMapping("/product/register")
	public String registerProduct(ProductRequest productRequest, MultipartFile product_thumb, MultipartFile[] product_images, HttpSession session) {
		try {
			// get Manager_ID from Session
		String manager_id = ((Map<String,Object>)session.getAttribute("admin")).get("manager_id").toString();
		int product_id = pSvc.insertProduct(productRequest,manager_id);
		iSvc.insert(product_thumb, product_images, product_id, manager_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/admin/product/manageProduct";
	}
	
	@ResponseBody
	@PostMapping("/admin/product/loadProductList")
	public List<ManageProductDTO> loadProductList(HttpServletRequest request) {
		
		
		HttpSession session = request.getSession();
		Map<String,Object> admin = (Map<String,Object>)session.getAttribute("admin");
		List<ManageProductDTO> productList = pSvc.getManage(admin.get("manager_id").toString());
		
		return productList;
		
	}
	
	@ResponseBody
	@PostMapping(value = "/admin/product/deleteProductList", produces="application/json; charset=UTF-8")
	public String deleteProductList(@RequestParam(value="checkBoxArr[]") List<String> checkBoxArr,HttpServletRequest request) {
		
		try {
			String dd = "dd";
		pSvc.deleteProduct(checkBoxArr,request);
		return "deleted Successfuuly";
		} catch (Exception e) {
			e.printStackTrace();
			return "deleted Failed";
		}
	}
	
	// Load ProductPage based on product_id
	@RequestMapping("/product/{product_id}")
	public String loadProductPage(@CookieValue(value="isView", required=false) String isView, 
			@PathVariable int product_id, Model model, HttpServletRequest request,HttpServletResponse response) {
			// Add anti-refresh later on
		try {
			pvSvc.addView(product_id);
			model.addAttribute("product",pSvc.loadProductDetailPage(product_id));
		} catch(Exception e) {
			
		}
		
		return "product/product_detail_page_test";
	}
	

	
	
	
	
}
