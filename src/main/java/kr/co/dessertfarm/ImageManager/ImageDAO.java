package kr.co.dessertfarm.ImageManager;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

public class ImageDAO {

	@Inject
	private SqlSession sqlSession;
	
	public void insertImage(List<ProductImageRequest> productImageRequest) throws Exception {
		sqlSession.insert("image.imageInsert",productImageRequest);
		System.out.println("[ImageDAO] : Insertion Success! ");
	}
	
	public List<String> getImageName (List<String> productIdList) {
		List<String> fileNameList = sqlSession.selectList("image.getImageName",productIdList);
		for (int i=0; i<fileNameList.size(); i++) {
			System.out.println(fileNameList.get(i));	
		}
		return fileNameList;	
	}
}
