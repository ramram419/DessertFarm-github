package kr.co.dessertfarm.product;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository("product")
public class ProductDAO {
	@Inject
	private SqlSession sqlSession;
	
	public void insertProduct(ProductRequest productRequest) {
		try {
			sqlSession.insert("product.insertProduct",productRequest);
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}
	
	public void insertProductImage(ProductImageRequest productImageRequest) {
		try {
			sqlSession.insert("product.insertProductImage",productImageRequest);
			System.out.println("<DAO> insertImageMethod Invoked");
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}
	
	public int getProductId(ProductRequest productRequest) {
		try {
			int productId = sqlSession.selectOne("product.getProductId",productRequest);
			System.out.println("<DAO> ID : " + productId);
			return productId;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}
	
	public List<ManageProductDTO> getManageProduct(String id) {
		List<ManageProductDTO> manageProductList = null;
		try {
			manageProductList = sqlSession.selectList("product.getManageProductList",id);
			return manageProductList;
		} catch (Exception e) {
			e.printStackTrace();
			return manageProductList;
		}
	}
}
