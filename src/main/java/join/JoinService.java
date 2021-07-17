package join;

import spring.MainDAO;
import spring.MainVO;

public class JoinService {
	private MainDAO mainDAO;
	
	public JoinService(MainDAO mainDAO) {
		this.mainDAO = mainDAO;
	}
	
	public String join(JoinRequest req) {
		MainVO mainVO = new MainVO(req.getId(), req.getPwd(), req.getConfirmPwd(), req.getName(), req.getEmail(), req.getJoinDate());
		mainDAO.insert(mainVO);
		return mainVO.getId();
	}
}
