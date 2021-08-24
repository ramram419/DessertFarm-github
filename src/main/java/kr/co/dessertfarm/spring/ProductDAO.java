package kr.co.dessertfarm.spring;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

import kr.co.dessertfarm.product.ManageProductDTO;
import kr.co.dessertfarm.product.ProductImageRequest;
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
	
	public void insertProductImage(ProductImageRequest productImageRequest) {
		try {
			sqlSession.insert("product.insertProductImage",productImageRequest);
			System.out.println("���������� ��ǰ�̹����� ��ϵǾ����ϴ�.");
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}
	
	public int getProductId(ProductRequest productRequest) {
		try {
		int productId = sqlSession.selectOne("product.getProductId",productRequest);
		System.out.println("��ǰ��ȣ : " + productId);
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