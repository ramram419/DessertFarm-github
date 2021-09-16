package kr.co.dessertfarm.dibs;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

public class DibsDAO {
	@Inject
	SqlSession session;
	
	public void insertDibs(HashMap<String,Object> map) throws Exception {
			session.insert("dibs.createDibs",map);
	}
	
	public void deleteDibs() {
			session.delete("");
	}
	
	public List<DibsDTO> readDibs(HashMap<String,Object> map) throws Exception {
			List<DibsDTO> dibsDtoList = session.selectList("dibs.getDibs", map);
			return dibsDtoList;
	}
}
