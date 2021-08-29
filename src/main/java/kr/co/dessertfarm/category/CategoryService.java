package kr.co.dessertfarm.category;

import org.springframework.beans.factory.annotation.Autowired;

import kr.co.dessertfarm.paging.PagingService;

public class CategoryService {
	@Autowired
	PagingService pagingService;
	
	private int displayProNum = pagingService.displayProNum; 
	private int displayListNum = pagingService.displayListNum;
	
	public CategoryDTO getCategoryProduct(int pageNum, String cate) {
				int totalCount = pagingService.getTotalCategory(cate);
				int dbLimitStart,findingCount;
				
				dbLimitStart = (pageNum-1)*displayProNum;
				if (dbLimitStart + displayProNum-1 > totalCount) {
					findingCount = totalCount-dbLimitStart+1;
				} else {
					findingCount = displayProNum;
				}
				
				return new CategoryDTO();
	}
}
