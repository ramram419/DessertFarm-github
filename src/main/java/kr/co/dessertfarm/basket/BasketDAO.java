package kr.co.dessertfarm.basket;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository("Basket")
public class BasketDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	public List<BasketDTO> selectBasket(HashMap<String, Object> map){
		List<BasketDTO> basketList = new ArrayList<BasketDTO>();
		basketList = sqlSession.selectList("basket.selectBasket", map);
		System.out.println("<DAO> basketList : " + basketList);
		return basketList;
	}
	
	public void deleteAfterOrder(HashMap<String, Object> map) {
		sqlSession.delete("basket.deleteAfterOrder", map);
	}
}
