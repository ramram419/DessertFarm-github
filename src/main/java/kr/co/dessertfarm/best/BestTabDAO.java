package kr.co.dessertfarm.best;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

public class BestTabDAO {

	@Autowired
	SqlSession sqlSession;
	
	public List<BestTabShopDTO> getBestShop() {
		List<String> list = sqlSession.selectList("product.getBestTabShopNames");
		for(int k=0; k<list.size(); k++)
			System.out.println(list.get(k));
		List<BestTabShopDTO> bestProductList = sqlSession.selectList("product.getBestTabShop",list);
		for(int i=0; i<bestProductList.size(); i++) {
			bestProductList.get(i).print();
		}
		return bestProductList;
	}
	
	public List<BestTabProductDTO> getBestProduct(int BEST_TAB_PRO_NUMBER) {
		return sqlSession.selectList("product.getBestTabProduct",BEST_TAB_PRO_NUMBER);
	}
}
