package org.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.Number3;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/test/*")
@AllArgsConstructor
public class TestController {
	
	//private TestService ts;
	
	@GetMapping("/test1")
	public String test1(String name, Model model) {
		model.addAttribute("name", name);
		return "/board/test2";
	}
	
//	@GetMapping("/test2")
//	public void test1(int num1, int num2, int num3, Model model) {
//		model.addAttribute("num1", num1);
//		model.addAttribute("num2", num2);
//		model.addAttribute("num3", num3);
//	}

	@GetMapping("/test2")
	public void test1(Number3 number3, Model model) {
		model.addAttribute(number3);
//		model.addAttribute("number3", number3);
//		model.addAttribute("num1", number3.getNum1());
//		model.addAttribute("num2", number3.getNum2());
//		model.addAttribute("num3", number3.getNum3());
//		이 모든게 다 같은 내용
	}
	
	@RequestMapping("/test3")
	public String test4(Number3 number3, RedirectAttributes	rttr) {
		rttr.addFlashAttribute(number3);
		return "redirect:/test/test4";
	}
	
	@GetMapping("/test4")
	public String test3(Number3 number3, Model model) {
		model.addAttribute("number3", number3);
		return "/test/test2";
	}
	
	@GetMapping("/test10")
	public void test10() {
	}
	
	@PostMapping("/test11")
	public void test10(Number3 number3, Model model) {
		model.addAttribute(number3);
	}
	
}
