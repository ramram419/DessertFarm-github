package kr.co.dessertfarm.product;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProductViewService {
	
	@Autowired
	ProductDAO pDao;
	
	public void addView(int product_id) throws Exception {
		pDao.addView(product_id);
	}
}
