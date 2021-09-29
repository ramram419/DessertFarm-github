package kr.co.dessertfarm.dibs;

import java.util.HashMap;
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
		System.out.println("redirect to dibsList?pageNum=1");
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
			System.err.println("占쌔댐옙 占쏙옙품占쏙옙 占싱뱄옙 占쏙옙占쌩쏙옙占싹댐옙.");
			return "Duplicate";
		} catch (java.lang.NullPointerException e) { // non-Login Exception 
			System.err.println("占싸깍옙占쏙옙占쏙옙 占십울옙占쌌니댐옙.");
			return "needLogin";
		} catch (ManagerAttemptDibsException e) {
			System.err.println("占쏙옙占쏙옙占쌘댐옙 占쏙옙 占쏙옙占쏙옙占� 占싱울옙占쏙옙 占쏙옙 占쏙옙占쏙옙占싹댐옙.");
			return "ManagerAttempt";
		} catch (Exception e) {
			e.printStackTrace();
			return "Etc_error";
		} 
	}
	
	// Delete dibs
	// Essential Parameter
	// client_id , List<String> product_id
	@PostMapping(value = "/dibs/delete" , produces="application/json; charset=UTF-8")
	@ResponseBody
	public int deleteDibs(@RequestParam(value = "deleteList[]") List<String> deleteList, HttpServletRequest req) {
		
		
		System.out.println("delete");
		Map<String,Object> delMap = new HashMap<String,Object>();
		
		try {
		// String client_id = ((Map<String,String>)session.getAttribute("user")).get("client_id").toString();
		String client_id = req.getParameter("client_id");
		delMap.put("client_id", client_id);
		delMap.put("delList", deleteList);
		dSvc.deleteDibs(delMap);
		return 0;
		} catch (Exception e) { 
			e.printStackTrace();
			return -1;
		}
	}

	// Read dibs
	// Essential Parameter
	// client_id , int pageNum
	@PostMapping("/dibs/read")
	@ResponseBody
	public List<DibsDTO> readDibs(HttpServletRequest req, HttpSession session, @RequestParam("pageNum") int pageNum) {
		List<DibsDTO> dibsDtoList = null;
		try {
		String client_id = ((Map<String,String>)session.getAttribute("user")).get("client_id").toString();
		dibsDtoList = dSvc.readDibs(client_id, pageNum);
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
