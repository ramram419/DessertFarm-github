package kr.co.dessertfarm.dibs;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class DibsController {
	
	@Autowired
	DibsService dSvc;
	
	@RequestMapping("/category/dibs")
	public String dibs(@RequestParam int product_id,HttpServletRequest request) {
		try {
		if (isAdmin(request.getSession()) == true)  {
			throw new ManagerAttemptDibsException();
		}
		dSvc.dibsService(request.getSession(), product_id);
		return "Success";
		} catch (org.springframework.dao.DuplicateKeyException e) { // duplicate dibs Exception
			System.err.println("해당 상품은 이미 찜했습니다.");
			return "Duplicate";
		} catch (java.lang.NullPointerException e) { // non-Login Exception 
			System.err.println("로그인이 필요합니다.");
			return "needLogin";
			
		} catch (ManagerAttemptDibsException e) {
			System.err.println("관리자는 찜 기능을 이용할 수 없습니다.");
			return "ManagerAttempt";
			
		} catch (Exception e) {
			e.printStackTrace();
			return "Etc_error";
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
