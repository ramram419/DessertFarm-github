package kr.co.dessertfarm.product;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ManageProductDTO {
	private String product_name;
	private String category; // 케이크/초	코케이크 , 마카롱/뚱카롱
	private String product_price;
	private boolean product_sales_stat;
	
	private String pro_img_server; // 서버 이미지 저장 경로
}
