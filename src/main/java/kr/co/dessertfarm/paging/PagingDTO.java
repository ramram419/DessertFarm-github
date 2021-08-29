package kr.co.dessertfarm.paging;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter

public class PagingDTO {
	private int displayProNum;
	private int displayListNum;
	private boolean leftArr;
	private boolean rightArr;
	private int totalCount;
	private int sector;
	private int sectorStart, sectorEnd;
	private int pageNum;
	private int totalPage;
	
	public PagingDTO (int dp, int dl, boolean la, boolean ra, int ttc, int st, int sts, int ste, int pn,int tp) {
		this.displayProNum = dp;
		this.displayListNum = dl;
		this.leftArr = la;
		this.rightArr = ra;
		this.totalCount = ttc;
		this.sector = st;
		this.sectorStart = sts;
		this.sectorEnd = ste;
		this.pageNum = pn;
		this.totalPage = tp;
	}
	
}
