package join;

import spring.MainDAO;
import spring.MainVO;

public class JoinService {
	private MainDAO mainDAO;
	
	public JoinService(MainDAO mainDAO) {
		this.mainDAO = mainDAO;
	}
	
	public String join(JoinRequest req) {
		MainVO mainVO = new MainVO(req.getClient_name(), req.getClient_id(), req.getClient_pwd(), req.getClient_email(), req.getClient_address(), req.getClient_tel(), req.getClient_entre(), req.getClient_kakao());
		mainDAO.insert(mainVO);
		return mainVO.getClient_id();
	}
}
