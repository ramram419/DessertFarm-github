package kr.co.dessertfarm.dibs;

import java.util.HashMap;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

public class DibsDAO {
	@Inject
	SqlSession session;
	
	public void insertDibs(HashMap<String,Object> map) throws Exception {
			session.insert("dibs.dibsInsert",map);
	}
}
