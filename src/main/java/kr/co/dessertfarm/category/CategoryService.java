package kr.co.dessertfarm.category;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import kr.co.dessertfarm.paging.PagingService;

public class CategoryService {
	@Autowired
	PagingService pagingService;
	
	@Autowired
	CategoryDAO categoryDao;
	
	private int displayProNum = 16; 
	private int displayListNum = 10;
	
	public List<CategoryDTO> getCategoryProduct(int pageNum, String cate) {
				int totalCount = pagingService.getTotalCategory(cate);
				int dbLimitStart,findingCount;
				
				dbLimitStart = (pageNum-1)*displayProNum;
				if (dbLimitStart + displayProNum-1 > totalCount) {
					findingCount = totalCount-dbLimitStart+1;
				} else {
					findingCount = displayProNum;
				}
				System.out.println("TOTAL : " + totalCount);
				System.out.println("fc :" + findingCount + "| dbL :" + dbLimitStart);
				
				HashMap<String, Object> map = new HashMap();
				map.put("cate", cate);
				map.put("dbLimitStart", dbLimitStart);
				map.put("findingCount", findingCount);
				
				return categoryDao.getCategoryDTO(map);
				
	}
}
