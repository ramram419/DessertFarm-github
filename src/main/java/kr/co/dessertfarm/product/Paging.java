package kr.co.dessertfarm.product;

import java.nio.file.spi.FileSystemProvider;

public class Paging {
	public static void main(String[] args) {
		int displayProNum = 16; // �� �������� ������ ��ǰ ����
		int displayListNum = 10; // �� �������� ������ ����Ʈ ����
		boolean leftArr = false;
		boolean rightArr = false;
		
		int pageNum = 11;
		String cate = "����ũ";
		int totalCount = 500; // ī�װ��� �� ��ǰ ���� ���� DB result
		int totalPage;
		int findingCount;
		
		// ��ü ������ ��
				if (totalCount % displayProNum > 0) {
					totalPage = (totalCount / displayProNum) +1; 
				} else {
					totalPage = totalCount / displayProNum;
				}
				
				// db���� limit���� �� ������ ������ ��ǰ �˻�
				int dbLimitStart;
				
				dbLimitStart = (pageNum-1)*displayProNum;
				
				if (dbLimitStart>totalCount) { 
					System.out.println("�ش� �������� �������� �ʽ��ϴ�.");
					return;
				}
				
				if (dbLimitStart + displayProNum-1 > totalCount) {
					findingCount = totalCount-dbLimitStart+1;
				} else {
					findingCount = displayProNum;
				}
				// dbLimitStart�� ��� ��Ī

				// ����¡ ����
				int sector = 0; // 0���� : 1~10 , 1���� : 11~20
				
				if (pageNum % displayListNum > 0) {
					sector = pageNum / displayListNum;
				} else if (pageNum % displayListNum == 0) {
					sector = (pageNum / displayListNum)-1;
				}
				
				int sectorStart = (sector*displayListNum)+1; // �� ���Ϳ��� ù��° ������
				int sectorEnd = (sector*displayListNum)+displayListNum; // �� ���Ϳ��� ������ ������
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
				System.out.println("[" + cate +"]" + " �˻� ��� : "+totalCount);
				System.out.println(pageNum + "������ �˻����� : " + dbLimitStart + "~" + (dbLimitStart+findingCount-1));
				System.out.println("# ����¡");
				System.out.println("����: " + sector);
				System.out.println("�ش缽�� ����: " + sectorStart + "~" + sectorEnd);
				System.out.println("��:" + leftArr + "|" + rightArr + "��");
			
				for (int i=0; i<50; i++) {
					System.out.println((i+1)+ "|" +16*i + "~" + (16*i+15));
				}
		
		}
	}


	
