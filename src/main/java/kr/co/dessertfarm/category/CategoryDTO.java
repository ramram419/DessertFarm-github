package kr.co.dessertfarm.category;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CategoryDTO {
	private String product_img_url; // thumb_img path on Server
	private String manager_name; // Shop Name 
	private String product_name; 
	private String product_price;
	private String product_id;
	private Boolean product_new;
	private Boolean product_best;

	
	public void print() {
		System.out.println("--------------------");
		System.out.println("이미지 :" + product_img_url);
		System.out.println("등록자 :" + manager_name);
		System.out.println("상품이름 :" + product_name);
		System.out.println("상품가격 :" + product_price);
		System.out.println("상품ID :" + product_price);
		System.out.println("신상품 여부 :" + product_new);
		System.out.println("인기상품 여부 :" + product_best);
	}
//	private boolean new_item;
//	private boolean best_item;
//	private boolean only_b_item;
}
