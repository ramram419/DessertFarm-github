package kr.co.dessertfarm.review;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository("Review")
public class ReviewDAO {
	@Inject
	private SqlSession sqlSession;
	
	public void reg_newReview(ReviewDTO dto) {
		sqlSession.insert("review.reg_newReview", dto);
	}
	
}
