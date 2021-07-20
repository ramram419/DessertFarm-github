package join;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class JoinManagerRequest {
	private int manager_num;
	private String manager_name;
	private String manager_id;
	private String manager_pwd;
	private String confirm_manager_pwd;
	private String manager_email;
	private String manager_address;
	private String manager_tel;
	private String manager_intro;
	private String manager_website;
	private String manager_image;
}
