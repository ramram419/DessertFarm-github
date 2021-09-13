package kr.co.dessertfarm.product;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

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
import kr.co.dessertfarm.product.ProductDAO;


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
	
	
	/*public ProductRequest adjustProductRequest(ProductRequest productRequest,String manager_id) {
		String cate1,cate2;
		cate1 = request.getParameter("category1");
		cate2 = request.getParameter("category2");
		productRequest.setCategoryCode(getCode(cate1,cate2));
		
		Map<String,Object> user = (Map<String,Object>)session.getAttribute("admin");
		productRequest.setManager_id(user.get("manager_id").toString());
		System.out.println("<Service> ManagerID : " + user.get("manager_id").toString());
		
		return productRequest;
	}
	
	public String getCode(String cate1, String cate2){
		try {
		DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
		DocumentBuilder documentBuilder = factory.newDocumentBuilder();
		Document document = documentBuilder.parse("classpath:codedata/categorycode.xml");
		
		Element root = document.getDocumentElement();
		
		System.out.println(root + " : " + root.getAttribute("name"));
		

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
	} */
	
	
	
	/* public Boolean saveProductImage(MultipartFile[] imgList,HttpServletRequest request,String id,int productId) {
		
		
		int imgNum = 0;
		String registId = id;
		String saveDir = 
				request.getSession().getServletContext().getRealPath("/resources/product_img");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		String currentDay = sdf.format(System.currentTimeMillis());
		
		File dir = new File(saveDir);
		if(!dir.exists()) {
			dir.mkdir();
		}
		
		for (int i=0; i<imgList.length; i++) {
			if (!imgList[i].isEmpty()) {
				String reName,pro_img_id;
				
				String orifileName = imgList[i].getOriginalFilename();
				String ext = orifileName.substring(orifileName.lastIndexOf("."));
				if (i==0) {
					reName = currentDay  + "_" + productId + "_" + id + "_" + "thumb" + ext;
					pro_img_id = productId + "_" + "thumb";
				} else {
					reName = currentDay  + "_" + productId + "_" + id + "_" + imgNum + ext;
					pro_img_id = productId + "_" + imgNum;
				}
				
				
				try {

					imgList[i].transferTo(new File(saveDir + "/" + reName));

					ProductImageRequest productImageRequest = new ProductImageRequest(pro_img_id,productId,reName,"/resources/product_img/"+reName,imgList[i].getSize(),id);
					pDao.insertProductImage(productImageRequest);
				} catch (Exception e) {
					e.printStackTrace();
					return false;
				}
			}
			imgNum++;
		}
		
		return true;	
	} */
	
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
		deleteProductImage(deleteProList,request);
		pDao.deleteProductImage(deleteProList);
		
	}
	
	public void deleteProductImage(List<String> deleteProList,HttpServletRequest request) {
		List<String> delImgList = pDao.getDeleteProductImageName(deleteProList);
		String saveDir = 
				request.getSession().getServletContext().getRealPath("/resources/product_img");
		if (delImgList != null) {
			for (int i=0; i<delImgList.size(); i++) {
				File delImg = new File(saveDir+"/"+delImgList.get(i));
				if (delImg.exists()) {
					if (delImg.delete()) {
						System.out.println("Delete file successfully");
					} else {
						System.out.println("Delete file failed");
					}
				} else {
					System.out.println("File does not exist");
				}
			}
		}
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
