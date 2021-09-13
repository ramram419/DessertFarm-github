package kr.co.dessertfarm.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import kr.co.dessertfarm.join.JoinController;
import kr.co.dessertfarm.join.JoinService;
import kr.co.dessertfarm.login.LoginController;
import kr.co.dessertfarm.login.LoginService;
import kr.co.dessertfarm.order.OrderController;
import kr.co.dessertfarm.product.ProductController;
import kr.co.dessertfarm.search.SearchController;
import kr.co.dessertfarm.article.ArticleController;
import kr.co.dessertfarm.aws.S3Controller;
import kr.co.dessertfarm.basket.BasketController;
import kr.co.dessertfarm.category.CategoryController;
import kr.co.dessertfarm.dibs.DibsController;
import kr.co.dessertfarm.front.FrontController;


@Configuration
public class ControllerConfig {
	@Autowired
	private LoginService loginSvc;
	
	@Autowired
	private JoinService joinSvc;
	
	@Bean
	public LoginController loginController() {
		LoginController loginController = new LoginController();
		loginController.setLoginService(loginSvc);
		return loginController;
	}
	
	@Bean
	public JoinController joinController() {
		JoinController joinController = new JoinController();
		joinController.setJoinService(joinSvc);
		return joinController;
	}
	
	@Bean
	public FrontController frontController() {
		FrontController frontController = new FrontController();
		return frontController;
	}
	
	@Bean
	public ProductController productController() {
		ProductController productController = new ProductController();
		return productController;
	}
	
	@Bean
	public ArticleController articleController() {
		ArticleController articleController = new ArticleController();
		return articleController;
	}
	
	@Bean
	public CategoryController categoryController() {
		CategoryController categoryController = new CategoryController();
		return categoryController;
	}
	
	@Bean
	public SearchController searchController() {
		SearchController searchController = new SearchController();
		return searchController;
	}
	
	@Bean 
	public DibsController dibsController() {
		DibsController dibsController = new DibsController();
		return dibsController;
	}
	
	@Bean
	public OrderController orderController() {
		OrderController orderController = new OrderController();
		return orderController;
	}
	
	@Bean
	public BasketController basketController() {
		BasketController basketController = new BasketController();
		return basketController;
	}
	
	@Bean
	public S3Controller s3Controller() {
		S3Controller s3Controller = new S3Controller();
		return s3Controller;
	}
}
