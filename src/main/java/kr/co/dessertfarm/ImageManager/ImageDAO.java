package kr.co.dessertfarm.ImageManager;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.dessertfarm.ImageManager.ProductImageRequest;

public class ImageDAO {

	@Inject
	private SqlSession sqlSession;
	
	public void insertImage(List<ProductImageRequest> productImageRequest) throws Exception {
		sqlSession.insert("image.imageInsert",productImageRequest);
		System.out.println("[ImageDAO] : Insertion Success! ");
	}
}
