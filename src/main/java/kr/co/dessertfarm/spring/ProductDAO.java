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
			System.out.println("���������� ��ǰ�� ��ϵǾ����ϴ�.");
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}
}
