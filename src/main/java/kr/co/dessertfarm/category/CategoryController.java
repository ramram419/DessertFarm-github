package kr.co.dessertfarm.category;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.dessertfarm.paging.PagingDTO;
import kr.co.dessertfarm.paging.PagingService;

@Controller
public class CategoryController {
	@Autowired
	PagingService pagingService;
	
	@Autowired
	CategoryService categoryService;
	
	// Click big category
	@RequestMapping(value ="/category/{big}")
	public String onClickBigCate(@PathVariable String big, HttpServletRequest request, Model model) {
		Integer pageNum = null;
		if (request.getParameter("pageNum") == null)
			pageNum = 1;
		else {
			pageNum = Integer.parseInt((request.getParameter("pageNum")));
		}
		big = big + "___";
		List<CategoryDTO> dto = categoryService.getCategoryProduct(pageNum, big);
		PagingDTO pDto = pagingService.categoryPaging(pageNum, pagingService.getTotalCategory(big));
		model.addAttribute("productList",dto);
		model.addAttribute("paging",pDto);
		return "home/contents/category";
	}
	
	// Click small category
	@RequestMapping(value ="/category/*/{small}")
	public String onClickSmallCate(@PathVariable String small, HttpServletRequest request, Model model) {
		Integer pageNum = null;
		if (request.getParameter("pageNum") == null)
			pageNum = 1;
		else {
			pageNum = Integer.parseInt((request.getParameter("pageNum")));
		}
		List<CategoryDTO> dto = categoryService.getCategoryProduct(pageNum, small);
		PagingDTO pDto = pagingService.categoryPaging(pageNum, pagingService.getTotalCategory(small));
		for (int i=0; i<dto.size(); i++) {
			dto.get(i).print();
		}
		model.addAttribute("productList",dto);
		model.addAttribute("paging",pDto);
		return "home/contents/category";
	}
	
	@RequestMapping("/category")
	public String categoryRed() {
		return "redirect:/category/K";
	}
}
