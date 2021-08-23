package kr.co.dessertfarm.spring;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

import kr.co.dessertfarm.product.ProductRequest;

public class ProductDAO {
	@Inject
	private SqlSession sqlSession;
	
	public void insertProduct(ProductRequest productRequest) {
		try {
			sqlSession.insert("product.insertProduct",productRequest);
			System.out.println("성공적으로 상품이 등록되었습니다.");
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}
}
