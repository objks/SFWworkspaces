package org.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class totoController {

	@RequestMapping("/toto")
	public void toto() {
		
	}
	
	@RequestMapping("/toto.do")
	public String toto(int winner, int dotori, Model model) {
		// 0은 2배, 1은 4배, 2는 3배
		
		int ran = (int)(Math.random()*3); // 0 ~ 2
		System.out.println(ran);
		String team;
		
		if(ran==0) team = "한국 승";
		else if(ran==1) team = "일본 승";
		else team = "무승부";
		
		if(ran!=winner) {
			dotori = 0;
		} else {
			if(ran==0) dotori = dotori * 2;
			else if (ran == 1) {
				dotori = dotori * 4;
			} else {
				dotori = dotori * 3;
			}
		}
		
		
		model.addAttribute("team", team);
		model.addAttribute("dotori", dotori);
		
		return "result";
	}
}
