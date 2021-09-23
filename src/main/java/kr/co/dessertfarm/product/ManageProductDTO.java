package kr.co.dessertfarm.product;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ManageProductDTO {
	private int product_id;
	private String product_name;
	private String category;
	private String product_price;
	private boolean product_sales_stat;
	private String product_img_url;	
}
