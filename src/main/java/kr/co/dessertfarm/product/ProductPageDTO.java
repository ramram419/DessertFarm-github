package kr.co.dessertfarm.product;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ProductPageDTO {
	private int product_id;
	private String category;
	private String product_name;
	private String product_price;
	private String product_value;
	private double product_rating;
	private String product_delivery;
	private String product_exchange;
	private String product_as;
	private String manager_id;
	
	public void print() {
		System.out.println("product_id : "+ product_id);
		System.out.println("category : " + category);
		System.out.println("product_name"+product_name);
		System.out.println("product_price"+product_price);
		System.out.println("product_value"+product_value);
		System.out.println("product_rating"+product_rating);
		System.out.println("product_delivery"+product_delivery);
		System.out.println("product_exchange"+product_exchange);
		System.out.println("product_as"+product_as);
		System.out.println("manager_id"+manager_id);
	}
}
