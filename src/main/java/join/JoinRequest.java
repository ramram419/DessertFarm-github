package join;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class JoinRequest {
	private int client_num;
	private String client_name;
	private String client_id;
	private String client_pwd;
	private String confirm_client_pwd;
	private String client_email;
	private String client_address;
	private String client_tel;
	private String client_entre;
	private String client_kakao;
}
