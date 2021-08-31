package kr.co.dessertfarm.article;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service("article")
public class ArticleService {
	@Inject
	private ArticleDAO articleDAO;
	
	public ArticleService(ArticleDAO articleDAO) {
		this.articleDAO = articleDAO;
	}
	
	public List<ArticleVO> selectOne(String id) {
		List<ArticleVO> list = new ArrayList<ArticleVO>();
		list = articleDAO.selectOne(id);
		System.out.println("<Service> : " + list + " ID : " + id);
		return list;
	}
	
	public void qnaRegister(ArticleVO vo) {
		articleDAO.qnaRegsiter(vo);
	}
	
}
