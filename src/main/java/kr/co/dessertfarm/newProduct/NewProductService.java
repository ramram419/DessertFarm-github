package kr.co.dessertfarm.newProduct;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import kr.co.dessertfarm.paging.PagingService;

public class NewProductService {
	
	@Autowired
	PagingService pagingService;
	
	@Autowired
	NewProductDAO npDao;

	public List<NewProductDTO> getNewProduct(int pageNum) throws Exception {
		int displayProNum = 16; 
		int displayListNum = 10;
		
		int totalCount = pagingService.getTotalNew();
		int dbLimitStart,findingCount;
		
		dbLimitStart = (pageNum-1)*displayProNum;
		if (dbLimitStart + displayProNum-1 > totalCount) {
			findingCount = totalCount-dbLimitStart+1;
		} else {
			findingCount = displayProNum;
		}
		System.out.println("<Service getCatgory> TOTAL : " + totalCount);
		System.out.println("<Service getCatgory> fc :" + findingCount + "| dbL :" + dbLimitStart);
		
		HashMap<String, Object> map = new HashMap();
		map.put("dbLimitStart", dbLimitStart);
		map.put("findingCount", findingCount);
		
		return npDao.getNewProduct(map);
		
}
}
