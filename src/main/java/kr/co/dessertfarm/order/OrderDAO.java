package kr.co.dessertfarm.order;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository("Order")
public class OrderDAO {
	@Inject
	private SqlSession sqlSession;
	
	public List<OrderDTO> selectOrderList(HashMap<String, Object> map) {
		List<OrderDTO> orderList = new ArrayList<OrderDTO>();
		orderList = sqlSession.selectList("order.selectOrderList", map);
		System.out.println("<DAO> orderList : " + orderList);
		return orderList;
	}
	
	public String selectOrderSend(HashMap<String, Object> map) {
		String send = sqlSession.selectOne("order.selectOrderSend", map);
		System.out.println("<DAO> orderSend : " + send);
		return send;
	}
	
	public String selectOrderId(HashMap<String, Object> map) {
		String detid = sqlSession.selectOne("order.selectOrderId", map);
		System.out.println("<DAO> orderdetId : " + detid);
		return detid;
	}
	
	public void insertOrder(OrderDTO orderDTO) {
		sqlSession.insert("order.insertOrderList", orderDTO);
	}
}
