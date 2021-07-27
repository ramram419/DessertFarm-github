package kr.co.dessertfarm.join;

import kr.co.dessertfarm.manager.JoinManagerRequest;
import kr.co.dessertfarm.spring.MainDAO;
import kr.co.dessertfarm.spring.MainVO;

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
	
	public String managerJoin(JoinManagerRequest mreq) {
		MainVO mainVO = new MainVO(mreq.getManager_name(), mreq.getManager_id(), mreq.getManager_pwd(), mreq.getManager_email(), mreq.getManager_address(), mreq.getManager_tel(), mreq.getManager_intro(), mreq.getManager_website(), mreq.getManager_image());
		mainDAO.managerInsert(mainVO);
		return mainVO.getManager_id();
	}
}
