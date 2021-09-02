package kr.co.dessertfarm.search;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.dessertfarm.paging.PagingService;

@Service("Search")
public class SearchService {
	@Autowired
	private SearchDAO sDAO;
	
	@Autowired
	private PagingService pagingService;
	
	private int displayProNum = 16; 
	private int displayListNum = 10;
	
	public List<SearchProductDTO> searchList(int pageNum, String keyword) {
		int totalCount = pagingService.getTotalSearchProduct(keyword);
		int dbLimitStart,findingCount;
		
		dbLimitStart = (pageNum-1)*displayProNum;
		if (dbLimitStart + displayProNum-1 > totalCount) {
			findingCount = totalCount-dbLimitStart+1;
		} else {
			findingCount = displayProNum;
		}
		System.out.println("<Service getSearchProduct> TOTAL : " + totalCount);
		System.out.println("<Service getSearchProduct> fc :" + findingCount + "| dbL :" + dbLimitStart);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		map.put("dbLimitStart", dbLimitStart);
		map.put("findingCount", findingCount);
		
		return sDAO.searchList(map);
	}
}
