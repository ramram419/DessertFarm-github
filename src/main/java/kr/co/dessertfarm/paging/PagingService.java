package kr.co.dessertfarm.paging;

import org.springframework.beans.factory.annotation.Autowired;

public class PagingService {
	
	@Autowired
	PagingDAO pagingDao;
	
	public int displayProNum = 16; // 한 페이지에 보여질 상품 개수
	public int displayListNum = 10; // 한 페이지에 보여질 리스트 개수
	boolean leftArr = false;
	boolean rightArr = false;
	
	public int getTotalCategory(String cate) {
		return pagingDao.getTotalCategory(cate);
	}
	
	public void categoryPaging(int pageNum, String category) {
		int totalCount = 45; // 카테고리의 총 상품 갯수 예시 DB result
		int totalPage;
		int findingCount;
		
		// 전체 페이지 수
		if (totalCount % displayProNum > 0) {
			totalPage = (totalCount / displayProNum) +1; 
		} else {
			totalPage = totalCount / displayProNum;
		}

		// 페이징 구역
		int sector = 0; // 0섹터 : 1~10 , 1섹터 : 11~20
		
		if (pageNum % displayListNum > 0) {
			sector = pageNum / displayListNum;
		} else if (pageNum % displayListNum == 0) {
			sector = (pageNum / displayListNum)-1;
		}
		
		int sectorStart = (sector*displayListNum)+1; // 한 섹터에서 첫번째 페이지
		int sectorEnd = (sector*displayListNum)+displayListNum; // 한 섹터에서 마지막 페이지
		if (sectorEnd >= totalPage) {
			sectorEnd = totalPage;
		}
		if (sector > 0) {
			leftArr = true;
		} else {
			leftArr = false;
		}
		
		if (sectorEnd < totalPage) {
			rightArr = true;
		}
	}
}
