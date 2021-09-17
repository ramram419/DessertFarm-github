package kr.co.dessertfarm.dibs;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.dessertfarm.paging.PagingService;



@Service
public class DibsService {

	@Autowired
	DibsDAO dDao;
	
	@Autowired
	PagingService pagingService;
	
	private final static int DIBS_DISPLAY_PRODUCT_NUM = 5;
	private final static int DIBS_LIST_PRODUCT_NUM = 10;
	
	public void createDibs(HttpSession session, int product_id ) throws Exception { 
		HashMap<String,Object> map = new HashMap<>();
		String client_id = ((Map<String,String>)session.getAttribute("user")).get("client_id").toString();
		map.put("client_id",client_id);
		map.put("product_id", product_id);
		dDao.insertDibs(map);
	}
	
	public List<DibsDTO> readDibs(String client_id, int pageNum) throws Exception{
		int totalCount = pagingService.getTotalDibs(client_id);
		int dbLimitStart,findingCount;
		
		dbLimitStart = (pageNum-1)*DIBS_DISPLAY_PRODUCT_NUM;
		if (dbLimitStart + DIBS_DISPLAY_PRODUCT_NUM-1 > totalCount) {
			findingCount = totalCount-dbLimitStart+1;
		} else {
			findingCount = DIBS_DISPLAY_PRODUCT_NUM;
		}
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("client_id", client_id);
		map.put("dbLimitStart", dbLimitStart);
		map.put("findingCount", findingCount);
		
		return dDao.readDibs(map);
	}
	
	
	
}
