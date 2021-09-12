package kr.co.dessertfarm.ImageManager;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter

public class ProductImageRequest {
	private int product_id;
	private String product_img_id;
	private String product_img_type;
	private String product_img_name;
	private String product_img_url;
	private long product_img_size;
	private String manager_id;
	
	public void print() {
		System.out.println("product_id : " + product_id);
		System.out.println("product_img_id : " + product_img_id);
		System.out.println("product_img_type : " + product_img_type);
		System.out.println("product_img_name : " + product_img_name);
		System.out.println("product_img_url : " + product_img_url);
		System.out.println("product_img_size : " + product_img_size);
		System.out.println("manager_id : " + manager_id);
	}
}


