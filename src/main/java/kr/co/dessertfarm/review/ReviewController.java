package kr.co.dessertfarm.review;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller("Review")
public class ReviewController {
	@Autowired
	private ReviewService rSvc;
}
