package org.zerock.domain;

import lombok.Data;

@Data
public class Number {
	
	private int num1;
	private int num2;
	private int sum;
	
	public void exec() {
		sum= num1 + num2;
	}
	
}
