package kr.co.dessertfarm.article;

import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ArticleController {
	@Inject
	private ArticleService articleSvc;
	
	public void setAtricleService(ArticleService articleSvc) {
		this.articleSvc = articleSvc;
	}
	
	@RequestMapping("/qnalist")
	public String mainArticle(Model model, HttpSession session, HttpServletRequest req) {
		session = req.getSession();
		Map<String, String> list = (Map<String, String>)session.getAttribute("user");
		String id = list.get("client_id").toString();
		System.out.println("<Controller> Id : " + id);
		model.addAttribute("list", articleSvc.selectOne(id));
		return "home/contents/QnAlist";
	}
}
