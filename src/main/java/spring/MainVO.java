package spring;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
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
}
