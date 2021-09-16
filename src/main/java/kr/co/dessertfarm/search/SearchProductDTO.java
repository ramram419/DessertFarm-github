package kr.co.dessertfarm.search;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SearchProductDTO {
	private String product_img_url;
	private String manager_name;
	private String product_name; 
	private String product_price;
}
