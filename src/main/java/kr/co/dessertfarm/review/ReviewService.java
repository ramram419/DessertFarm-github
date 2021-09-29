package kr.co.dessertfarm.review;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("Review")
public class ReviewService {
	@Autowired
	private ReviewDAO rDAO;
}
