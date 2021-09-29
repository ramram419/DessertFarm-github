package kr.co.dessertfarm.ImageManager;

import lombok.Getter;
import lombok.Setter;

import org.springframework.web.multipart.MultipartFile;

import com.amazonaws.services.s3.model.ObjectMetadata;

@Getter
@Setter
public class ImageDTO {
	private String image_name;
	private MultipartFile image_file;
	private ObjectMetadata metadata;
	
	
}
