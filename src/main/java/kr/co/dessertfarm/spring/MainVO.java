package kr.co.dessertfarm.spring;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class MainVO {
	private int client_num;
	private String client_name;
	private String client_id;
	private String client_pwd;
	private String client_email;
	private String client_address;
	private String client_tel;
	private String client_entre;
	private String client_kakao;
	
	private int manager_num;
	private String manager_name;
	private String manager_id;
	private String manager_pwd;
	private String manager_email;
	private String manager_address;
	private String manager_tel;
	private String manager_intro;
	private String manager_website;
	private String manager_image;
	
	public MainVO(String client_name, String client_id, String client_pwd, String client_email, String client_address, String client_tel, String client_entre, String client_kakao) {
		this.client_name = client_name;
		this.client_id = client_id;
		this.client_pwd = client_pwd;
		this.client_email = client_email;
		this.client_address = client_address;
		this.client_tel = client_tel;
		this.client_entre = client_entre;
		this.client_kakao = client_kakao;
	}
	
	public MainVO(String client_id, String client_pwd, String client_email, String client_address, String client_tel, String client_entre, String client_kakao) {
		this.client_id = client_id;
		this.client_pwd = client_pwd;
		this.client_email = client_email;
		this.client_address = client_address;
		this.client_tel = client_tel;
		this.client_entre = client_entre;
		this.client_kakao = client_kakao;
	}
	
	public MainVO(String manager_name, String manager_id, String manager_pwd, String manager_email, String manager_address, String manager_tel, String manager_intro, String manager_website, String manager_image) {
		this.manager_name = manager_name;
		this.manager_id = manager_id;
		this.manager_pwd = manager_pwd;
		this.manager_email = manager_email;
		this.manager_address = manager_address;
		this.manager_tel = manager_tel;
		this.manager_intro = manager_intro;
		this.manager_website = manager_website;
		this.manager_image = manager_image;
	}
}
