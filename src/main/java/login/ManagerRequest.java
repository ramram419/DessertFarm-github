package login;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ManagerRequest {
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
}
