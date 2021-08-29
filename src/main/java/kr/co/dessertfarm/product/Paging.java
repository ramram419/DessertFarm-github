package kr.co.dessertfarm.product;

import java.nio.file.spi.FileSystemProvider;

public class Paging {
	public static void main(String[] args) {
		int displayProNum = 16; // 한 페이지에 보여질 상품 개수
		int displayListNum = 10; // 한 페이지에 보여질 리스트 개수
		boolean leftArr = false;
		boolean rightArr = false;
		
		int pageNum = 11;
		String cate = "케이크";
		int totalCount = 500; // 카테고리의 총 상품 갯수 예시 DB result
		int totalPage;
		int findingCount;
		
		// 전체 페이지 수
				if (totalCount % displayProNum > 0) {
					totalPage = (totalCount / displayProNum) +1; 
				} else {
					totalPage = totalCount / displayProNum;
				}
				
				// db에서 limit으로 각 페이지 마다의 상품 검색
				int dbLimitStart;
				
				dbLimitStart = (pageNum-1)*displayProNum;
				
				if (dbLimitStart>totalCount) { 
					System.out.println("해당 페이지가 존재하지 않습니다.");
					return;
				}
				
				if (dbLimitStart + displayProNum-1 > totalCount) {
					findingCount = totalCount-dbLimitStart+1;
				} else {
					findingCount = displayProNum;
				}
				// dbLimitStart로 결과 서칭

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
				
				System.out.println("# DB");
				System.out.println("[" + cate +"]" + " 검색 결과 : "+totalCount);
				System.out.println(pageNum + "페이지 검색범위 : " + dbLimitStart + "~" + (dbLimitStart+findingCount-1));
				System.out.println("# 페이징");
				System.out.println("섹터: " + sector);
				System.out.println("해당섹터 범위: " + sectorStart + "~" + sectorEnd);
				System.out.println("◀:" + leftArr + "|" + rightArr + "▶");
			
				for (int i=0; i<50; i++) {
					System.out.println((i+1)+ "|" +16*i + "~" + (16*i+15));
				}
		
		}
	}


	
