package kr.co.dessertfarm.product;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import kr.co.dessertfarm.spring.ProductDAO;

@Service("product")
public class ProductService {
	@Autowired
	ProductDAO pDao;
	
	public ProductRequest adjustProductRequest(ProductRequest productRequest,HttpServletRequest request, HttpSession session) {
		String cate1,cate2;
		cate1 = request.getParameter("category1");
		cate2 = request.getParameter("category2");
		productRequest.setCategoryCode(getCode(cate1,cate2));
		
		Map<String,Object> user = (Map<String,Object>)session.getAttribute("user");
		productRequest.setManager_id(user.get("client_id").toString());
		
		return productRequest;
	}
	
	// DB에 상품 정보 삽입
	public void insertProduct(ProductRequest productRequest) {
			pDao.insertProduct(productRequest);
	}
		
	// DB에 이미지 정보 삽입
	public void insertProductImage() {
		
	}
	
	// 카테고리 코드 설정
	public void setCode() {
		
	}
	
	// 카테고리 코드 변환
	public String getCode(String cate1, String cate2){
		try {
		DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
		DocumentBuilder documentBuilder = factory.newDocumentBuilder();
		Document document = documentBuilder.parse("classpath:codedata/categorycode.xml");
		
		Element root = document.getDocumentElement();
		
		System.out.println(root + " 과 " + root.getAttribute("name"));
		
		NodeList productList = root.getElementsByTagName("product");
		
		for (int i=0; i<productList.getLength(); i++) {
			
			Node productNode = productList.item(i);
			
			if (productNode.getNodeType() == Node.ELEMENT_NODE) {
				Element productEle = (Element)productNode;
				
				//big
				NodeList bigList = productEle.getElementsByTagName("big");
				Element bigEle = (Element)bigList.item(0);
				Node big = bigEle.getFirstChild();
				
				//small
				NodeList smallList = productEle.getElementsByTagName("small");
				Element smallEle = (Element)smallList.item(0);
				Node small = smallEle.getFirstChild();
				
				if (big.getNodeValue().equals(cate1) && small.getNodeValue().equals(cate2)) {
					NodeList cateList = productEle.getElementsByTagName("code");
					Element codeEle = (Element)cateList.item(0);
					Node code = codeEle.getFirstChild();
					return code.getNodeValue();
				}
			}
		}
		} catch (Exception e) {
			e.printStackTrace();
			return "badCode";
		}
		return "badCode";
	}
	
	// 대표이미지 + 추가이미지
	public void combineImgList() {
		
	}
	
	
	
	
	
}
