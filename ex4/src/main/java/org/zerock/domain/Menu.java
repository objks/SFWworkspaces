<<<<<<< HEAD
package org.zerock.domain;

import lombok.Data;

@Data
public class Menu {
	String menu;
	String result ="";
	
	public void result() {
		if(menu.equals("kor")) {
			result = "중식, 양식 ,일식";
		} else if (menu.equals("chi")) {
			result = "한식, 양식 ,일식";
		} else if (menu.equals("jap")) {
			result = "한식, 양식 , 중식";
		}else {
			result = "한식, 중식 ,일식";
		}
	}
	
}
=======
package org.zerock.domain;

import lombok.Data;

@Data
public class Menu {
	String menu;
	String result ="";
	
	public void result() {
		if(menu.equals("kor")) {
			result = "중식, 양식 ,일식";
		} else if (menu.equals("chi")) {
			result = "한식, 양식 ,일식";
		} else if (menu.equals("jap")) {
			result = "한식, 양식 , 중식";
		}else {
			result = "한식, 중식 ,일식";
		}
	}
	
}
>>>>>>> 442f98c48e220c700b90ea66ff9090a6b01d9012
