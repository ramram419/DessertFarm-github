package kr.co.dessertfarm.search;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.dessertfarm.paging.PagingDTO;
import kr.co.dessertfarm.paging.PagingService;

@Controller("Search")
public class SearchController {
	@Autowired
	private SearchService sSvc;
	
	@Autowired
	private PagingService pSvc;
	
	
	@RequestMapping("/search")
	public String search(HttpServletRequest req, String keyword, Model model) {
		Integer pageNum = null;
		if (req.getParameter("pageNum") == null)
			pageNum = 1;
		else {
			pageNum = Integer.parseInt((req.getParameter("pageNum")));
		}
		keyword = req.getParameter("keyword");
		List<SearchProductDTO> searchList = sSvc.searchList(pageNum, keyword);
		PagingDTO pDTO = pSvc.searchPaging(pageNum, pSvc.getTotalSearchProduct(keyword));
		model.addAttribute("searchList", searchList);
		model.addAttribute("paging", pDTO);
		return "home/contents/searchResult";
	}
}
