package kr.co.dessertfarm.order;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.dessertfarm.paging.PagingService;

@Service("Order")
public class OrderService {
	@Autowired
	private OrderDAO oDAO;
	
	@Autowired
	private PagingService pagingService;
	
	private int displayProNum = 5; 
	private int displayListNum = 10; 
	
	public List<OrderDTO> orderList(int pageNum, String id){
		int totalCount = pagingService.getTotalOrder(id);
		int dbLimitStart,findingCount;
		
		dbLimitStart = (pageNum-1)*displayProNum;
		if (dbLimitStart + displayProNum-1 > totalCount) {
			findingCount = totalCount-dbLimitStart+1;
		} else {
			findingCount = displayProNum;
		}
		System.out.println("<Service getOrder> TOTAL : " + totalCount);
		System.out.println("<Service getOrder> fc :" + findingCount + "| dbL :" + dbLimitStart);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("dbLimitStart", dbLimitStart);
		map.put("findingCount", findingCount);
		
		return oDAO.selectOrderList(map);
	}
	
	public String orderSend(String id, String product_name, String order_date, String order_detid) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		order_detid = orderDetId(id, product_name, order_date);
		map.put("id", id);
		map.put("product_name", product_name);
		map.put("order_date", order_date); 
		map.put("order_detid", order_detid);
		System.out.println("<Service> order_detid : " + order_detid);
		return oDAO.selectOrderSend(map);
	}
	
	public String orderDetId(String id, String product_name, String order_date) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("product_name", product_name);
		map.put("order_date", order_date);
		return oDAO.selectOrderId(map);
	}
	
	public void insertOrder(OrderDTO orderDTO) {
		oDAO.insertOrder(orderDTO);
	}
}
