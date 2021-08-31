package kr.co.dessertfarm.article;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository("Article")
public class ArticleDAO {
	@Inject
	private SqlSession sqlSession;

	public List<ArticleVO> selectOne(String id) {
		List<ArticleVO> list = new ArrayList<ArticleVO>();
		list = sqlSession.selectList("article.selectList", id);
		System.out.println("<DAO> articleList : " + list + " ID : " + id);
		return list;
	}
	
	public void qnaRegsiter(ArticleVO vo) {
		sqlSession.insert("article.qnaRegister", vo);
	}
}
