package kr.co.dessertfarm.dibs;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class DibsDTO {
	private int product_id;
	private String product_img_url;
	private boolean product_new;
	private boolean product_best;
	private String manager_name;
	private String product_name;
	private String product_price;
}
