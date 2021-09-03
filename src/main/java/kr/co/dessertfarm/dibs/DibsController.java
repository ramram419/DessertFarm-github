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
	
	public boolean isAdmin(HttpSession session) {
		if (session.getAttribute("admin") != null) {			
			return true;
		} else {
			return false;
		}
	}
	
}
