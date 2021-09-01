package kr.co.dessertfarm.article;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ArticleVO {
	private int qna_id;
	private String manager_id;
	private String client_id;
	private String qna_title;
	private String qna_value;
	private Date qna_date;
	private int rownum;
}
