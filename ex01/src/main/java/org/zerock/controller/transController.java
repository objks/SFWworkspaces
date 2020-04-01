package org.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class transController {

	@RequestMapping("/translate")
	public void translate() {
		
	}
	
	@RequestMapping("/translate.do")
	public String translate(String eng, Model model) {
		String kor = "번역불가";
		
		if (eng.equals("hello")) {
			System.out.println("헬로 -> 안녕");
			kor = "안녕";
			
		} if (eng.equals("this is a apple")) {
			System.out.println("헬로 -> 안녕");
			kor = "이것은 사과";
			
		} 
		
		model.addAttribute("eng", eng);
		model.addAttribute("kor", kor);
		
		
		return "trans";
	}
}
