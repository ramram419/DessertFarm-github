package kr.co.dessertfarm.product;

public class Paging {
	public static void main(String[] args) {
		int startNum,endNum;
		int totalNum = 145; // �� ��ǰ ����
		int displayNum = 16; // �� ������ ��ȣ�� �������� �Խù� ����
		int pageNum = 0; // �� ������ �� 
		
		if (totalNum%displayNum > 0) 
			pageNum = (totalNum/displayNum) + 1;
		 else if (totalNum%displayNum == 0)
			pageNum = (totalNum/displayNum);
		
		// getStartNum : �������� �����ϴ� ��ȣ
		for (int i=0; i<pageNum; i++) {
			if (i!=0) { 
				startNum = i*displayNum;
			} else {
				startNum = 0;
			}
			
			if(i != pageNum-1) { // ������ �������϶�
				endNum = ((i+1) * displayNum)-1;
			} else {
				endNum = totalNum;
			}
			
			System.out.println(i+1 + "������ : " + startNum + " ~ " + endNum);	
		}
	}
}
	
