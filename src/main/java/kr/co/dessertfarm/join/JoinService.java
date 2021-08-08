package kr.co.dessertfarm.join;

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
	
	public void reg_client(MainVO vo) {
		mainDAO.reg_client(vo);
	}
	
	public void reg_manager(MainVO vo) {
		mainDAO.reg_manager(vo);
	}
	
	public void changePwd_client(MainVO vo) {
		mainDAO.changePwd_client(vo);
	}
	
	public void changePwd_Manager(MainVO vo) {
		mainDAO.changePwd_manager(vo);
	}
}
