package kr.co.dessertfarm.product;

public class Paging {
	public static void main(String[] args) {
		int startNum,endNum;
		int totalNum = 145; // 총 상품 갯수
		int displayNum = 16; // 한 페이지 번호에 보여지는 게시물 갯수
		int pageNum = 0; // 총 페이지 수 
		
		if (totalNum%displayNum > 0) 
			pageNum = (totalNum/displayNum) + 1;
		 else if (totalNum%displayNum == 0)
			pageNum = (totalNum/displayNum);
		
		// getStartNum : 페이지별 시작하는 번호
		for (int i=0; i<pageNum; i++) {
			if (i!=0) { 
				startNum = i*displayNum;
			} else {
				startNum = 0;
			}
			
			if(i != pageNum-1) { // 마지막 페이지일때
				endNum = ((i+1) * displayNum)-1;
			} else {
				endNum = totalNum;
			}
			
			System.out.println(i+1 + "페이지 : " + startNum + " ~ " + endNum);	
		}
	}
}
	
