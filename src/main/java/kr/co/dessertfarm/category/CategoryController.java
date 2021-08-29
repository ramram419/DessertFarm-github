package kr.co.dessertfarm.category;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.dessertfarm.paging.PagingService;

@Controller
public class CategoryController {
	@Autowired
	PagingService pagingService;
	
	// Click big category
	@RequestMapping(value ="/category/{big}")
	public String onClickBigCate(@PathVariable String big, HttpServletRequest request) {
		System.out.println("big invoked");
		
		return "product/productlistpage";
	}
	
	// Click small category
	@RequestMapping(value ="/category/*/{small}")
	public String onClickSmallCate(@PathVariable String small, HttpServletRequest request) {
		System.out.println("small invoked");
		int pageNum = Integer.parseInt((String)request.getParameter("pageNum"));
		pagingService.categoryPaging(pageNum, small);
		
		return "product/productlistpage";
	}
}
