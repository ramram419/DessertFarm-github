package kr.co.dessertfarm.paging;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import kr.co.dessertfarm.article.ArticleVO;

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
}
