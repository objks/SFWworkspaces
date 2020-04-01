package org.zerock.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.zerock.domain.UserDTO;

@Controller
public class QuizController2 {

	@RequestMapping("/login")
	public void login() {
		
	}
	
	@RequestMapping("/login.bo")
	public String success(@RequestParam("id") String id, @RequestParam("pw") String pw, Model model) {
		model.addAttribute("id", id);
		model.addAttribute("pw", pw);
		
		return "success";
	}
	
	@RequestMapping("/login.do")
	public String loginDo(UserDTO dto, Model model) {
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
		Date time = new Date();
		String time1 = format1.format(time);
		model.addAttribute("time", time1);
		
		return "hello";
	}
	
//	@RequestMapping("success")
//	public String success(Member member, Model model) {
//		member.exec2();
//		model.addAttribute("result", member);
//		
//		return "member";
//	}
	
}
