package kr.co.dessertfarm.paging;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

public class PagingDAO {
	@Autowired
	SqlSession sqlSession;
	
	public int getTotalCategory(String cate) {
		try {
			int total = sqlSession.selectOne("category.getCateTotalCount",cate);
			return total;
		} catch(Exception e) {
			e.printStackTrace();
			return -1;
		}
	
		
	}
	
	public int getTotalArticle(String id) {
		try {
			int total = sqlSession.selectOne("article.getTotalArticle", id);
			return total;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}
	
	public int getTotalSearchProduct(String keyword) {
		try {
			int total = sqlSession.selectOne("search.getTotalSearchProduct", keyword);
			return total;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}
	
	public int getTotalOrder(String id) {
		try {
			int total = sqlSession.selectOne("order.getTotalOrder", id);
			return total;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}
	
	public int getTotalBasket(String id) {
		try {
			int total = sqlSession.selectOne("basket.getTotalBasket", id);
			return total;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}

	public int getTotalDibs(String id)  {
		return sqlSession.selectOne("dibs.getTotalDibs", id);
	}
}
