package kr.co.dessertfarm.basket;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BasketDTO {
	private String client_id;
	private int product_id;
	private int product_quan;
	private int product_price;
	private String product_name;
}
