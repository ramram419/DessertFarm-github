package kr.co.dessertfarm.category;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CategoryController {

	// Click big category
	@RequestMapping(value ="/category/{big}")
	public String onClickBigCate(@PathVariable String big) {
		
		return "";
	}
	
	// Click small category
	@RequestMapping(value ="/category/**/{small}")
	public String onClickSmallCate(@PathVariable String small) {
		
		return "";
	}
}
