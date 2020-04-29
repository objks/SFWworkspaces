<<<<<<< HEAD
package org.zerock.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString

public class Criteria {
	private int pageNum = 1;
	private int amount = 10;		// 한 페이지에 보여줄 데이터
	
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;		// 페이지에서 보여주는 데이터 수
	}

	public Criteria() {
		
	}
}
=======
package org.zerock.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString

public class Criteria {
	private int pageNum = 1;
	private int amount = 10;		// 한 페이지에 보여줄 데이터
	
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;		// 페이지에서 보여주는 데이터 수
	}

	public Criteria() {
		
	}
}
>>>>>>> 442f98c48e220c700b90ea66ff9090a6b01d9012
