package kr.co.dessertfarm.article;

import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.dessertfarm.paging.PagingService;

@Controller
public class ArticleController {
	@Inject
	private ArticleService articleSvc;
	
	@Autowired
	private PagingService pagingService;
	
	public void setAtricleService(ArticleService articleSvc) {
		this.articleSvc = articleSvc;
	}
	
	@RequestMapping("/qnalist")
	public String mainArticle(Model model, HttpSession session, HttpServletRequest req) {
		session = req.getSession();
		Map<String, String> list = (Map<String, String>)session.getAttribute("user");
		String id = list.get("client_id").toString();
		System.out.println("<Controller> Id : " + id);
		model.addAttribute("list", articleSvc.getArticleList(Integer.parseInt(req.getParameter("pageNum")), id));
		model.addAttribute("paging", pagingService.articlePaging(Integer.parseInt(req.getParameter("pageNum")), pagingService.getTotalArticle(id)));
		return "home/contents/QnAlist";
	}
	
	@RequestMapping("/qnalist/new")
	public String qnaNew() {
		return "home/contents/qnaRegister";
	}
	
	@RequestMapping("/qnalist/register")
	public String qnaRegister(HttpServletRequest req, HttpSession session) {
		ArticleVO vo = new ArticleVO();
		Map<String, String> list = (Map<String, String>)session.getAttribute("user");
		String id = list.get("client_id").toString();
		vo.setClient_id(id);
		vo.setQna_title(req.getParameter("qna_title"));
		vo.setQna_value(req.getParameter("qna_value"));
		articleSvc.qnaRegister(vo);
		System.out.println(id);
		return "redirect:/qnalist";
	}
}
