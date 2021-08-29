package kr.co.dessertfarm.category;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CategoryDTO {
	private String pro_img_server; // thumb_img path on Server
	private String manager_name; // Shop Name 
	private String product_name; 
	private String product_price;
//	private boolean new_item;
//	private boolean best_item;
//	private boolean only_b_item;
}
