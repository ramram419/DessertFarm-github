package kr.co.dessertfarm.category;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

public class CategoryDAO {

	@Autowired
	SqlSession sqlSession;
	
	public List<CategoryDTO> getCategoryDTO( HashMap<String,Object> map) {
		List<CategoryDTO> categoryDTO = null;
		try {
			 categoryDTO = sqlSession.selectList("category.getSmallCategoryDTO",map);
			 for (int i=0; i<categoryDTO.size(); i++) {
				 if (categoryDTO.get(i).getPro_img_server() == null) {
					 categoryDTO.get(i).setPro_img_server("/resource/abc.jpg");
				 }
			 }
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
			 for (int i=0; i<categoryDTO.size(); i++) {
				 if (categoryDTO.get(i).getPro_img_server() == null) {
					 categoryDTO.get(i).setPro_img_server("/resource/abc.jpg");
				 }
			 }
			 return categoryDTO;
		} catch (Exception e) {
			e.printStackTrace();
			return categoryDTO;
		}
	}
}
