package kr.co.dessertfarm.paging;

import org.springframework.beans.factory.annotation.Autowired;

public class PagingService {
	
	@Autowired
	PagingDAO pagingDao;
	
	public int displayProNum = 16; // 
	public int displayListNum = 10; //
	boolean leftArr = false;
	boolean rightArr = false;
	
	
	
	public PagingDTO categoryPaging(int pageNum, int totalCount) {
		int totalPage;
		
		// 
		if (totalCount % displayProNum > 0) {
			totalPage = (totalCount / displayProNum) +1; 
		} else {
			totalPage = totalCount / displayProNum;
		}

		// 
		int sector = 0; // 0���� : 1~10 , 1���� : 11~20
		if (pageNum % displayListNum > 0) {
			sector = pageNum / displayListNum;
		} else if (pageNum % displayListNum == 0) {
			sector = (pageNum / displayListNum)-1;
		}
		
		int sectorStart = (sector*displayListNum)+1; // 
		int sectorEnd = (sector*displayListNum)+displayListNum; // 
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
		
		return new PagingDTO(displayProNum,displayListNum,leftArr,rightArr,totalCount,sector,sectorStart,sectorEnd, pageNum,totalPage);
	}
	
	public int getTotalCategory(String cate) {
		return pagingDao.getTotalCategory(cate);
	}
	
	
	
	
	
	
}
