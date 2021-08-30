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
}
