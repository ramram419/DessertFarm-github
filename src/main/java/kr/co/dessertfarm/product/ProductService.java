package kr.co.dessertfarm.product;

import java.io.File;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

@Service("product")
public class ProductService {
	@Autowired
	ProductDAO pDao;
	
	public int insertProduct(ProductRequest productRequest,String manager_id) {
		productRequest.setManager_id(manager_id);	
		int product_id = pDao.insertProduct(productRequest);
		return product_id;
			
	}

	public ProductRequest setManager(ProductRequest productRequest, String manager_id) {
		productRequest.setManager_id(manager_id);
		return productRequest;
	}
	
	public String getReverseCode(String categoryCode) { // Need Refactoring
		try {
			DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
			DocumentBuilder documentBuilder = factory.newDocumentBuilder();
			Document document = documentBuilder.parse("classpath:codedata/categorycode.xml");
			
			Element root = document.getDocumentElement();
			NodeList productList = root.getElementsByTagName("product");
			
			for (int i=0; i<productList.getLength(); i++) {
				
				Node productNode = productList.item(i);
				
				if (productNode.getNodeType() == Node.ELEMENT_NODE) {
					Element productEle = (Element)productNode;
					
					NodeList cateList = productEle.getElementsByTagName("code");
					Element codeEle = (Element)cateList.item(0);
					Node code = codeEle.getFirstChild();

					String cateCode = code.getNodeValue(); // K001
					
					if (cateCode.equals(categoryCode)) {
						NodeList bigList = productEle.getElementsByTagName("big");
						Element bigEle = (Element)bigList.item(0);
						
						Node big = bigEle.getFirstChild(); 
						
						NodeList smallList = productEle.getElementsByTagName("small");
						Element smallEle = (Element)smallList.item(0);
						Node small = smallEle.getFirstChild();
						
						String reverseCode = big.getNodeValue() + "/" + small.getNodeValue();
						return reverseCode;
					}
					
					
				}
			}
			} catch (Exception e) {
				e.printStackTrace();
				return "badCode";
			}
			return "badCode";
		}
	
	
	public List<ManageProductDTO> getManage(String id) {
		List<ManageProductDTO> manageProductList =  pDao.getManageProduct(id);
		
			for(int k=0; k<manageProductList.size(); k++) {
			manageProductList.get(k).setCategory(getReverseCode(manageProductList.get(k).getCategory()));;
		}
		

		return manageProductList;
		
	}

	public void deleteProduct(List<String> deleteProList, HttpServletRequest request) {
		pDao.deleteProduct(deleteProList);		
	}
	

	public HashMap<String,Object> loadProductDetailPage(int product_id) throws Exception {
		HashMap<String,Object> productInfo = new HashMap<String,Object>();
		ProductPageDTO productDto = pDao.getProduct(product_id);
		List<String> productImg = pDao.getProductImage(product_id);
		productInfo.put("DTO", productDto);
		productInfo.put("IMG", productImg);
		
		return productInfo;
	}
}
