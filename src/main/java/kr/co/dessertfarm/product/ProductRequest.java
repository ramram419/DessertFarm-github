package kr.co.dessertfarm.product;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ProductRequest {
	private int product_id;
	private String category;
	private String product_name;
	private int product_price;
	private String product_value;
	private Date product_date;
	private double product_rating;
}
