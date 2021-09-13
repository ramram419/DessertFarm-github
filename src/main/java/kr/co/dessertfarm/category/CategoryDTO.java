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
	private String product_id;
	
	public void print() {
		System.out.println("--------------------");
		System.out.println("이미지 :" + pro_img_server);
		System.out.println("등록자 :" + manager_name);
		System.out.println("상품이름 :" + product_name);
		System.out.println("상품가격 :" + product_price);
		System.out.println("상품ID :" + product_price);
	}
//	private boolean new_item;
//	private boolean best_item;
//	private boolean only_b_item;
}
