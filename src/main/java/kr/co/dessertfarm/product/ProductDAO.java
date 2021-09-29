package kr.co.dessertfarm.product;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository("product")
public class ProductDAO {
	@Inject
	private SqlSession sqlSession;
	
	// CREATE
	
	public int insertProduct(ProductRequest productRequest) {
		try {
			sqlSession.insert("product.insertProduct",productRequest);
			sqlSession.insert("product.insertProductViewSet",productRequest.getProduct_id());
			return productRequest.getProduct_id();
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		} 
	}
	// READ
	
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
	
	public ProductPageDTO getProduct(int product_id) throws Exception {
		ProductPageDTO product = sqlSession.selectOne("product.getProduct",product_id);
		product.print();
		return product;
	}
	
	public List<String> getProductImage(int product_id) throws Exception {
		List<String> imgList = sqlSession.selectList("product.getProductImage",product_id);
		return imgList;
	}
	
	/* public List<String> getDeleteProductImageName(List<String> deleteProList) {
		List<String> delProImgName = null;
	try {
		delProImgName = sqlSession.selectList("product.getProductImageName",deleteProList);
		System.out.println(delProImgName);
		return delProImgName;
	} catch (Exception e) {
		e.printStackTrace();
		return delProImgName;
	}
	} */
	
	// DELETE
	
	public void deleteProduct(List<String> deleteProList) {
		try {
			sqlSession.delete("product.deleteProduct",deleteProList);
			System.out.println("Products deleted successfully.");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/* public void deleteProductImage(List<String> deleteProList) {
		try {
			sqlSession.delete("product.deleteProductImage",deleteProList);
			System.out.println("Product's Images deleted successfully.");
		} catch (Exception e) {
			e.printStackTrace();
		
		}
	} */
	
	// UPDATE
	
	public void addView(int product_id) throws Exception {
		sqlSession.update("product.addView",product_id);
	}
	

	public void modifyProduct (HashMap<String, String> map) throws Exception {
		sqlSession.update("product.modifyProduct",map);
	}
	
	
}
