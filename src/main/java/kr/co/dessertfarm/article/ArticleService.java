package kr.co.dessertfarm.article;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.dessertfarm.category.CategoryDTO;
import kr.co.dessertfarm.paging.PagingService;

@Service("article")
public class ArticleService {
	@Inject
	private ArticleDAO articleDAO;
	
	@Autowired
	private PagingService pagingService;
	
	public ArticleService(ArticleDAO articleDAO) {
		this.articleDAO = articleDAO;
	}
	
	public void qnaRegister(ArticleVO vo) {
		articleDAO.qnaRegsiter(vo);
	}
	
	private int displayProNum = 5; 
	private int displayListNum = 10;
	
	public List<ArticleVO> getArticleList(int pageNum, String id) {
				int totalCount = pagingService.getTotalArticle(id);
				int dbLimitStart,findingCount;
				
				dbLimitStart = (pageNum-1)*displayProNum;
				if (dbLimitStart + displayProNum-1 > totalCount) {
					findingCount = totalCount-dbLimitStart+1;
				} else {
					findingCount = displayProNum;
				}
				System.out.println("TOTAL : " + totalCount);
				System.out.println("fc :" + findingCount + "| dbL :" + dbLimitStart);
				
				HashMap<String, Object> map = new HashMap();
				map.put("id", id);
				map.put("dbLimitStart", dbLimitStart);
				map.put("findingCount", findingCount);
				
				return articleDAO.selectOne(id, map);
				
	}
}
