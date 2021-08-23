package kr.co.dessertfarm.product;

import java.io.File;
import java.text.SimpleDateFormat;
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
	
	// DB�� ��ǰ ���� ����
	public void insertProduct(ProductRequest productRequest,MultipartFile[] imgList,HttpServletRequest request) {
			pDao.insertProduct(productRequest);
			int productId = pDao.getProductId(productRequest);
			saveProductImage(imgList,request,productRequest.getManager_id(),productId);
	}
		
	// DB�� �̹��� ���� ����
	public void insertProductImage() {
		
	}
	
	// �ڵ� ��ȯ �� ����� ���̵� ���� �ʱ�ȭ
	public ProductRequest adjustProductRequest(ProductRequest productRequest,HttpServletRequest request, HttpSession session) {
		String cate1,cate2;
		cate1 = request.getParameter("category1");
		cate2 = request.getParameter("category2");
		productRequest.setCategoryCode(getCode(cate1,cate2));
		
		Map<String,Object> user = (Map<String,Object>)session.getAttribute("user");
		productRequest.setManager_id(user.get("client_id").toString());
		
		return productRequest;
	}
	
	// ī�װ� �ڵ� ��ȯ
	public String getCode(String cate1, String cate2){
		try {
		DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
		DocumentBuilder documentBuilder = factory.newDocumentBuilder();
		Document document = documentBuilder.parse("classpath:codedata/categorycode.xml");
		
		Element root = document.getDocumentElement();
		
		System.out.println(root + " �� " + root.getAttribute("name"));
		
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
	
	// ��ǥ�̹��� + �߰��̹���
	public MultipartFile[] combineImgList(MultipartFile thumb, MultipartFile[] images) {
		MultipartFile[] imgList = new MultipartFile[images.length+1];
		imgList[0] = thumb;
		System.arraycopy(images, 0, imgList, 1, images.length);
		return imgList;
	}
	
	public Boolean saveProductImage(MultipartFile[] imgList,HttpServletRequest request,String id,int productId) {
		
		
		int imgNum = 0;
		// ����� ID
		String registId = id;
		String saveDir = 
				request.getSession().getServletContext().getRealPath("/resources/product_img");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		String currentDay = sdf.format(System.currentTimeMillis());
		
		File dir = new File(saveDir);
		if(!dir.exists()) {
			dir.mkdir();
		}
		// �����̸� : ��¥_��ǰ��ȣ_�����_��ȣ(������ ������ �ø����).Ȯ����
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
				// �����ϴ� transferTo �޼ҵ�
				imgList[i].transferTo(new File(saveDir + "/" + reName));
				// db�� �����ϱ� ���� Request ����
				ProductImageRequest productImageRequest = new ProductImageRequest(pro_img_id,productId,reName,"resource/img/"+reName,imgList[i].getSize(),id);
				pDao.insertProductImage(productImageRequest);
				} catch (Exception e) {
					e.printStackTrace();
					return false;
				}
			}
			imgNum++;
		}
		
		return true;	
	}
	
	
	
}
