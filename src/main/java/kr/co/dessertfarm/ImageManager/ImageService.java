package kr.co.dessertfarm.ImageManager;

import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.DeleteObjectRequest;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.PutObjectRequest;

import kr.co.dessertfarm.aws.S3Controller;

@Service("Image")
public class ImageService {
	
	private Logger logger = LoggerFactory.getLogger(S3Controller.class);
	
	@Autowired
	private AmazonS3 s3Client;
	
	@Value("${cloud.aws.s3.bucket}")
	private String bucket;
	
	@Value("${cloud.aws.s3.bucket.path}") // IMAGE URL CONTEXT PATH
	private String path;
	
	@Autowired
	ImageDAO imgDao;
	
	
	// CREATE
	// insert process
	public void insert(MultipartFile thumb, MultipartFile[] images, int product_id,String manager_id) throws Exception {
		MultipartFile[] imgList = combineImage(thumb,images);
		List<ImageDTO> imageFileDto = getImageFileDtoList(imgList);
		uploadImage(imageFileDto);
		insertImage(getProductImageRequestList(imageFileDto,product_id,manager_id));
	}
	
	public void insertImage(List<ProductImageRequest> productImageRequest) throws Exception {
		for (int i=0; i<productImageRequest.size(); i++) {
			productImageRequest.get(i).print();
		}
		imgDao.insertImage(productImageRequest);
	}
	
	public void uploadImage(List<ImageDTO> imageFileDto) throws Exception {
		for(int i=0; i<imageFileDto.size(); i++) {
			PutObjectRequest putObjectRequest = new PutObjectRequest(
					bucket
					,imageFileDto.get(i).getImage_name()
					,imageFileDto.get(i).getImage_file().getInputStream()
					,imageFileDto.get(i).getMetadata());
			 putObjectRequest.setCannedAcl(CannedAccessControlList.PublicRead);
			 s3Client.putObject(putObjectRequest);
			 logger.info("[S3] : FileName = " + imageFileDto.get(i).getImage_name() + " Upload File Success");
		}
	}
	
	public List<ImageDTO> getImageFileDtoList(MultipartFile[] MultiImgList) throws Exception {
		List<ImageDTO> imageFileDtoList = new ArrayList<ImageDTO>();
		
		for(int i=0; i<MultiImgList.length; i++) {
			ImageDTO imageFileDto = new ImageDTO();
			imageFileDto.setImage_name(toUUID(MultiImgList[i]));
			imageFileDto.setImage_file(MultiImgList[i]);
			imageFileDto.setMetadata(getMetadata(MultiImgList[i]));
			imageFileDtoList.add(imageFileDto);
		}
		for (int k=0; k<imageFileDtoList.size(); k++)  {
			System.out.println(imageFileDtoList.get(k).getImage_name());
		}
		return imageFileDtoList;
	}
	
	private ObjectMetadata getMetadata(MultipartFile file) {
		ObjectMetadata metadata = new ObjectMetadata();
		metadata.setContentType("image/" + getImageExt(file).substring(1));
		metadata.setContentLength(file.getSize());

		return metadata;
	}
	
	public List<ProductImageRequest> getProductImageRequestList (List<ImageDTO> imgList,int product_id, String manager_id) {
		List<ProductImageRequest> imgReqList = new ArrayList<ProductImageRequest>();

		for (int i=0; i<imgList.size(); i++) {
			imgReqList.add(getProductImageRequest(i,imgList,product_id,manager_id));
		}
		
		return imgReqList;
	}
	
	private ProductImageRequest getProductImageRequest (int index,List<ImageDTO> imgList,int product_id, String manager_id) {
		ProductImageRequest productImageRequest = new ProductImageRequest();
		productImageRequest.setProduct_id(product_id);
		if (index==0) {
			productImageRequest.setProduct_img_type("thumb");
		} else {
			productImageRequest.setProduct_img_type("detail");
		}
		productImageRequest.setProduct_img_id(product_id + "_" + index);
		productImageRequest.setProduct_img_name(imgList.get(index).getImage_name());
		productImageRequest.setProduct_img_url(path + "/" + imgList.get(index).getImage_name());
		productImageRequest.setProduct_img_size((imgList.get(index).getImage_file().getSize()) / 1024);
		productImageRequest.setManager_id(manager_id);
		return productImageRequest; 
	}
	
	public MultipartFile[] combineImage(MultipartFile thumb, MultipartFile[] images) {
		MultipartFile[] multiImgList = new MultipartFile[images.length+1];
		multiImgList[0] = thumb;
		System.arraycopy(images, 0, multiImgList, 1, images.length);
		return multiImgList;
	}
	
	public String toUUID(MultipartFile imgFile) {
		String ext = getImageExt(imgFile);
		UUID imgIden = UUID.randomUUID();
		String uuidName = imgIden.toString() + ext; 
		System.out.println(uuidName);
		return uuidName;
	}
	
	public String getImageExt(MultipartFile imgFile) {
		String oriName = imgFile.getOriginalFilename();
		String ext = oriName.substring(oriName.lastIndexOf("."));
		return ext; 
	}
	
	// DELETE
	public void deleteImage(List<String> fileNameList) { 
		for (int i=0; i<fileNameList.size(); i++) {
			DeleteObjectRequest deleteObjectRequest = new DeleteObjectRequest(bucket,fileNameList.get(i));
			s3Client.deleteObject(deleteObjectRequest);
			logger.info("[S3] : FileName = " + fileNameList.get(i) + " deleted.");
		}
	}
	
	public List<String> getFileNameList(List<String> productIdList) {
		return imgDao.getImageName(productIdList);
	}
	
	// MODIFY
	public void modifyImage() {
		
	}
}
