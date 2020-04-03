package org.zerock.domain;

import lombok.Data;

@Data
public class Compare {
	private int num5;
	private String big = "큽니다.";
	private String small = "작습니다.";
	private String result;
	
	public void result() {
		if(num5 < 10) {
			result = big;
		} else {
			result = small;
		}
	}

}
