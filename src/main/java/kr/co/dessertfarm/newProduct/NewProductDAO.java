package kr.co.dessertfarm.newProduct;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

public class NewProductDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	public List<NewProductDTO> getNewProduct(HashMap<String,Object> map) throws Exception {
		return sqlSession.selectList("product.getNewProduct",map);
	}
}
