package kr.co.dessertfarm.category;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("Category")
public class CategoryDAO {

	@Autowired
	SqlSession sqlSession;
	
	public List<CategoryDTO> getCategoryDTO( HashMap<String,Object> map) {
		List<CategoryDTO> categoryDTO = null;
		try {
			 categoryDTO = sqlSession.selectList("category.getCategoryDTO",map);
			 return categoryDTO;
		} catch (Exception e) {
			e.printStackTrace();
			return categoryDTO;
		}
	}
	
	public List<CategoryDTO> getBigCategoryDTO( HashMap<String,Object> map) {
		List<CategoryDTO> categoryDTO = null;
		try {
			 categoryDTO = sqlSession.selectList("category.getSmallCategoryDTO",map);
			 return categoryDTO;
		} catch (Exception e) {
			e.printStackTrace();
			return categoryDTO;
		}
	}
}
