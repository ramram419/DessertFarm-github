package kr.co.dessertfarm.dibs;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

public class DibsDAO {
	@Inject
	SqlSession session;
	
	public void insertDibs(HashMap<String,Object> map) throws Exception {
			session.insert("dibs.createDibs",map);
	}
	
	public void deleteDibs(Map<String, Object> delMap) throws Exception{
			System.out.println(delMap.toString());
		
			session.delete("dibs.deleteDibs",delMap);
			System.out.println("delete Success");
	}
	
	public List<DibsDTO> readDibs(HashMap<String,Object> map) throws Exception {
			List<DibsDTO> dibsDtoList = session.selectList("dibs.getDibs", map);
			return dibsDtoList;
	}
}
