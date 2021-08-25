package kr.co.dessertfarm.product;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ManageProductDTO {
	private String product_name;
	private String category;
	private String product_price;
	private boolean product_sales_stat;
	private String pro_img_server;
	
}
