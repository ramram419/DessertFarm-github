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
}
