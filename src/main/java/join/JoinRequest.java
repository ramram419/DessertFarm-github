package join;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class JoinRequest {
	private String id;
	private String pwd;
	private String confirmPwd;
	private String name;
	private String email;
	private Date joinDate;
}
