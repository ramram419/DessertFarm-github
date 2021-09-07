package kr.co.dessertfarm.basket;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.dessertfarm.paging.PagingService;

@Service("Basket")
public class BasketService {
	@Autowired
	private BasketDAO bDAO;
	
	@Autowired
	private PagingService pagingService;
	
	private int displayProNum = 5; 
	private int displayListNum = 10; 
	
	public List<BasketDTO> selectBasket(int pageNum, String id){
		int totalCount = pagingService.getTotalBasket(id);
		int dbLimitStart,findingCount;
		
		dbLimitStart = (pageNum-1)*displayProNum;
		if (dbLimitStart + displayProNum-1 > totalCount) {
			findingCount = totalCount-dbLimitStart+1;
		} else {
			findingCount = displayProNum;
		}
		System.out.println("<Service getBasket> TOTAL : " + totalCount);
		System.out.println("<Service getBasket> fc :" + findingCount + "| dbL :" + dbLimitStart);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("dbLimitStart", dbLimitStart);
		map.put("findingCount", findingCount);
		
		return bDAO.selectBasket(map);
	} 
}
