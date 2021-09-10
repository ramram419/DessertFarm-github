package kr.co.dessertfarm.order;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class OrderDTO {
	private String order_detid;
	private int order_id;
	private int product_id;
	private int product_quan;
	private int product_price;
	private String product_name;
	private Date order_date;
	private String order_send;
	private String client_id;
}
