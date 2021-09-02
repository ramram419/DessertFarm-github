package kr.co.dessertfarm.search;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository("Search")
public class SearchDAO {
	@Inject
	private SqlSession sqlSession;
	
	public List<SearchProductDTO> searchList(HashMap<String, Object> map) {
		List<SearchProductDTO> searchList = new ArrayList<SearchProductDTO>();
		searchList = sqlSession.selectList("search.searchProduct", map);
		return searchList;
	}
}
