package kr.co.dessertfarm.dibs;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



@Service
public class DibsService {

	@Autowired
	DibsDAO dDao;
	
	public void dibsService(HttpSession session, int product_id ) throws Exception { 
		HashMap<String,Object> map = new HashMap<>();
		String client_id = ((Map<String,String>)session.getAttribute("user")).get("client_id").toString();
		map.put("client_id",client_id);
		map.put("product_id", product_id);
		dDao.insertDibs(map);
	}
	
}
