package kr.co.dessertfarm.awsTest;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.amazonaws.AmazonClientException;
import com.amazonaws.AmazonServiceException;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.PutObjectRequest;

@RestController
public class S3Controller {
	
	private Logger logger = LoggerFactory.getLogger(S3Controller.class);
	
	@Autowired
	private AmazonS3 s3Client;
	
	@Value("${cloud.aws.s3.bucket}")
	private String bucket;
	
	public File convert(MultipartFile file) throws IOException {
		File convFile = new File(file.getOriginalFilename());
		convFile.createNewFile();
		FileOutputStream fos = new FileOutputStream(convFile);
		fos.write(file.getBytes());
		fos.close();
		return convFile;
	}
	
	@PostMapping("/upload")
	public String uploadSingle(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest req) throws Exception {
		try {
			String fName = multipartFile.getOriginalFilename();
			System.out.println(fName.indexOf("."));
			if(fName.indexOf(".") != -1) {
				String ext = fName.split("\\.")[1];
				PutObjectRequest putObjectRequest = new PutObjectRequest(bucket, UUID.randomUUID() + "." + ext, convert(multipartFile));
				putObjectRequest.setCannedAcl(CannedAccessControlList.PublicRead);
				s3Client.putObject(putObjectRequest);
				logger.info("Upload File Success");
			}
		} catch (AmazonServiceException ase) {
			logger.info("AmazonServiceException : ");
			logger.info("Error Msg : " + ase.getMessage());
			logger.info("HTTP Status Code : " + ase.getStatusCode());
			logger.info("AWS Error Code : " + ase.getErrorCode());
			logger.info("Error Type : " + ase.getErrorType());
			logger.info("Request Id : " + ase.getRequestId());
			logger.info("Bucket Name : " + bucket);
		}catch(AmazonClientException ace) {
			logger.info("AmazonClientException : ");
			logger.info("Error Msg : " + ace.getMessage());
			logger.info("Bucket Name : " + bucket);
		}
		return "success";
	}

}
