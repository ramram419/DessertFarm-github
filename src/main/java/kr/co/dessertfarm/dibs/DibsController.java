package kr.co.dessertfarm.dibs;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.dessertfarm.paging.PagingDTO;
import kr.co.dessertfarm.paging.PagingService;

@Controller
public class DibsController {
	
	@Autowired
	DibsService dSvc;
	
	@Autowired
	PagingService pSvc;
	
	@RequestMapping("/dibs")
	public String dibsRedirect() {
		return "redirect:/dibslist?pageNum=1";
	}
	
	@RequestMapping("/dibslist")
	public String dibs(HttpServletRequest req, HttpSession session, Model model) {
		Integer pageNum = null;
		if (req.getParameter("pageNum") == null)
			pageNum = 1;
		else {
			pageNum = Integer.parseInt((req.getParameter("pageNum")));
		}
		try {
			String client_id = ((Map<String,String>)session.getAttribute("user")).get("client_id").toString();
			System.out.println(client_id);
			PagingDTO pDTO = pSvc.dibsPaging(pageNum, pSvc.getTotalDibs(client_id));
			model.addAttribute("paging",pDTO);
			return "home/contents/likelist";
		} catch (Exception e) {
			e.printStackTrace();
			return "home/contents/likelist";
		}
		
	}
	
	// Create dibs
	@RequestMapping("/dibs/create")
	@ResponseBody
	public String createDibs(@RequestParam int product_id,HttpSession session) {
		try {
		if (isAdmin(session) == true)  {
			throw new ManagerAttemptDibsException();
		}
		dSvc.createDibs(session, product_id);
		return "Success";
		} catch (org.springframework.dao.DuplicateKeyException e) { // duplicate dibs Exception
			System.err.println("�ش� ��ǰ�� �̹� ���߽��ϴ�.");
			return "Duplicate";
		} catch (java.lang.NullPointerException e) { // non-Login Exception 
			System.err.println("�α����� �ʿ��մϴ�.");
			return "needLogin";
		} catch (ManagerAttemptDibsException e) {
			System.err.println("�����ڴ� �� ����� �̿��� �� �����ϴ�.");
			return "ManagerAttempt";
		} catch (Exception e) {
			e.printStackTrace();
			return "Etc_error";
		} 
	}
	
	// Delete dibs
	@PostMapping("/dibs/delete")
	public String deleteDibs() {
		return "";
	}

	// Read dibs
	@PostMapping("/dibs/read")
	@ResponseBody
	public List<DibsDTO> readDibs(HttpServletRequest req, HttpSession session, @RequestParam("pageNum") int pageNum) {
		System.out.println("readDibs");
		List<DibsDTO> dibsDtoList = null;
		try {
		String client_id = ((Map<String,String>)session.getAttribute("user")).get("client_id").toString();
		dibsDtoList = dSvc.readDibs(client_id, pageNum);
		for (int i=0; i<dibsDtoList.size(); i++) {
			System.out.println(dibsDtoList.get(i).getProduct_id());
		}
		return dibsDtoList;
		} catch (Exception e) {
			e.printStackTrace();
			return dibsDtoList;
		}
		
	}
	
	
	
	public boolean isAdmin(HttpSession session) {
		if (session.getAttribute("admin") != null) {			
			return true;
		} else {
			return false;
		}
	}
	
	
	
	
	
	
}
