package kr.co.dessertfarm.product;


public class ProductImageRequest {
	private String pro_img_id;
	private int product_id;
	private String pro_img_name;
	private String pro_img_server;
	private long pro_filesize;
	private String manager_id;
	
	public ProductImageRequest(String pro_img_id, int productId, String pro_img_name, String pro_img_server, long pro_filesize,String manager_id) {
		this.pro_img_id = pro_img_id;
		this.product_id = productId;
		this.pro_img_name = pro_img_name;
		this.pro_img_server = pro_img_server;
		this.pro_filesize = pro_filesize;
		this.manager_id = manager_id;
	}
	
}
