package kr.co.dessertfarm.newProduct;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter

public class NewProductDTO {
	private String product_img_url; // thumb_img path on Server
	private String manager_name; // Shop Name 
	private String product_name; 
	private String product_price;
	private String product_id;
	private Boolean product_new;
	private Boolean product_best;
	
	public void print() {
		System.out.println("--------------------");
		System.out.println("�̹��� :" + product_img_url);
		System.out.println("����� :" + manager_name);
		System.out.println("��ǰ�̸� :" + product_name);
		System.out.println("��ǰ���� :" + product_price);
		System.out.println("��ǰID :" + product_price);
		System.out.println("�Ż�ǰ ���� :" + product_new);
		System.out.println("�α��ǰ ���� :" + product_best);
	}
}
