package kr.co.dessertfarm.review;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ReviewDTO {
	private int review_id;
	private int product_id;
	private String client_id;
	private String review_title;
	private String review_value;
	private Float review_rating;
	private Date review_date;
}
