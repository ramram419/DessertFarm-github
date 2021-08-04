package kr.co.dessertfarm.join;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.dessertfarm.spring.MainDAO;
import kr.co.dessertfarm.spring.MainVO;

@Service("join")
public class JoinService {
	@Inject
	private MainDAO mainDAO;
	
	public JoinService(MainDAO mainDAO) {
		this.mainDAO = mainDAO;
	}
	
//	public int client_Join(MainVO vo, Map<String, Object> param) {
//		param = new HashMap<String, Object>();
//		param.put("client_name", vo.getClient_name());
//		param.put("client_id", vo.getClient_id());
//		param.put("client_pwd", vo.getClient_pwd());
//		param.put("client_email", vo.getClient_email());
//		param.put("client_address", vo.getClient_address());
//		param.put("client_tel", vo.getClient_tel());
//		int succ = mainDAO.client_Join(vo, param);
//		return succ;
//	}
	
	public void reg_client(MainVO vo) {
		mainDAO.reg_client(vo);
	}
	
	public int manager_Join(MainVO vo) {
		int succ = mainDAO.manager_Join(vo);
		return succ;
	}
}
