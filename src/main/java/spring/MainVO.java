package spring;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MainVO {
	private String id;
	private String pwd;
	private String confirmPwd;
	private String name;
	private String email;
	private Date joinDate;
	
	public MainVO(String id, String pwd, String confirmPwd, String name, String email, Date joinDate) {
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.confirmPwd = confirmPwd;
		this.email = email;
		this.joinDate = joinDate;
	}
}
