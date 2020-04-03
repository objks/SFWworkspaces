package org.zerock.domain;

import lombok.Getter;

@Getter
public class PageDTO {	
	private int startPage;
	private int endPage;
	private boolean prev, next;
	
	private Criteria cri;		// 현재페이지와 몇개씩 보여줄지 정보
	private int total;			// 전체 데이터 수
	
	
	public PageDTO(Criteria cri, int total) {
		this.cri = cri;
		this.total = total;
		
		this.endPage = (int)(Math.ceil(cri.getPageNum() / 10.0)) * 10;	// 페이지 하단에 페이지번호는 10개씩
		this.startPage = this.endPage - 9;
		
		int realEnd = (int)(Math.ceil(total * 1.0) / cri.getAmount());		// 진짜 마지막 페이지
		
		if(this.endPage > realEnd) {
			this.endPage = realEnd;
		}
		
		this.prev = this.startPage > 1;
		this.next = this.endPage < realEnd;
	}
	
	
	
}
