package kr.co.dessertfarm.spring;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

import kr.co.dessertfarm.product.ProductImageRequest;
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
	
	public void insertProductImage(ProductImageRequest productImageRequest) {
		try {
			sqlSession.insert("product.insertProductImage",productImageRequest);
			System.out.println("성공적으로 상품이미지가 등록되었습니다.");
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}
	
	public int getProductId(ProductRequest productRequest) {
		try {
		int productId = sqlSession.selectOne("product.getProductId",productRequest);
		System.out.println("상품번호 : " + productId);
		return productId;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
		
	}
}
