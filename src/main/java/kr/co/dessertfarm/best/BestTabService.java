package kr.co.dessertfarm.best;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

public class BestTabService {
	
	private final int BEST_TAB_PRO_NUMBER = 12;
	
	@Autowired
	BestTabDAO bDao;
	
	public List<BestTabShopDTO> getBestShop() {
		return bDao.getBestShop();
	}
	
	public List<BestTabProductDTO> getBestProduct() {
		return bDao.getBestProduct(BEST_TAB_PRO_NUMBER);
	}
}
