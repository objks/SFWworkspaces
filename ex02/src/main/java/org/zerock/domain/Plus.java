package org.zerock.domain;

import lombok.Data;

@Data
public class Plus {
	private int num1;
	private int num2;
	private int result;
	
	public void result() {
		result = num1 + num2;
	}
}
