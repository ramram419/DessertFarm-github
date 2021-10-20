package kr.co.dessertfarm.best;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BestTabShopDTO {
	private String product_id;
	private String manager_name;
	private String manager_website;
	private String product_img_url;
	
	public void print() {
		System.out.println("product_img_id : " + product_id );
		System.out.println("manager_name : " + manager_name );
		System.out.println("manager_website : " + manager_website );
		System.out.println("product_img_url : " + product_img_url );
	}
}

