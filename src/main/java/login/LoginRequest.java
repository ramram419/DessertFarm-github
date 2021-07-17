package login;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class LoginRequest {
	private String id;
	private String pwd;
	private String name;
	private String email;
	private Date joinDate;
	
}
