package kr.co.dessertfarm.product;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ProductRequest {
	private String product_name;
	private String categoryCode;
	private int product_price;
	private String product_value;
	private String product_unit;
	private String product_delivery;
	private String product_exchange;
	private String product_as;
	private String manager_id;
	
	public void print() {
		System.out.println("product_name : " + product_name);
		System.out.println("categoryCode : " + categoryCode);
		System.out.println("product_price : " + product_price);
		System.out.println("product_value : " + product_value);
		System.out.println("product_unit : " + product_unit);
		System.out.println("product_delivery : " + product_delivery);
		System.out.println("product_exchange : " + product_exchange);
		System.out.println("product_as : " + product_as);
		System.out.println("manager_id : " + manager_id);
	}
	
	
}
