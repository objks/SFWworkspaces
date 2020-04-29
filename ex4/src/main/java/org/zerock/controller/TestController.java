<<<<<<< HEAD
package org.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.Between;
import org.zerock.domain.Compare;
import org.zerock.domain.Menu;
import org.zerock.domain.Number3;
import org.zerock.domain.Plus;
import org.zerock.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/test/*")
@AllArgsConstructor
public class TestController {
	
	private BoardService service;
	
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
	
	@GetMapping("/test5")
	public void test5() {

	}
	
	@PostMapping("/test6")
	public String test6(Plus plus, Model model) {
		plus.result();
		model.addAttribute("plus", plus);
		return "/test/test7";
	}
	
	@GetMapping("/test8")
	public void test8() {

	}
	
	@PostMapping("/test9")
	public String test9(Compare compare,Model model) {
		compare.result();
		model.addAttribute("compare", compare);
		return "/test/test9";
	}
	
	@GetMapping("/test20")
	public void test20() {
		
	}
	
	@PostMapping("/test20")
	public String test20(int num1, int num2, Model model) {
		int sum = 0;
		for (int i = num1; i <= num2; i++) {
			sum += i;			
		}
		
		model.addAttribute("sum", sum);	// 보낼 때
		return "/test/test21";
	}
	
	@GetMapping("/test22")
	public void test22() {
		
	}
	
	@PostMapping("/test22")
	public String test23(Menu menu, Model model) {
		model.addAttribute("menu", menu);
		menu.result();
		return "/test/test23";		
	}
	
	@GetMapping("/test25")
	public void test25() {
		
	}
	
	@PostMapping("/test25")
	public String test26(int[] menu, Model model) {
		int num = menu.length;
		
		model.addAttribute("num", menu.length);
//		model.addAttribute("num", num); 같은거
		return "/test/test26";
	}

	@GetMapping("/test30")
	public String test30(Model model) {
		model.addAttribute("count", service.scount());
		return "/test/test30";
	}
	
	@GetMapping("/test31")
	public String test31(Model model) {
		model.addAttribute("user", service.user());
		return "/test/test31";
	}
	
	@GetMapping("/test33")
	public void test33() {
	}
	
	@PostMapping("/test34")
	public void test34(String search, Model model) {
		model.addAttribute("search", search);
		model.addAttribute("count", service.count(search));
	}
	
	@GetMapping("/test40")
	public void test40() {
	}
	
	@PostMapping("/test41")
	public void test41(Between between, Model model) {
		model.addAttribute(between);
		model.addAttribute("bcount", service.bcount(between));
	}
	
}
=======
package org.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.Between;
import org.zerock.domain.Compare;
import org.zerock.domain.Menu;
import org.zerock.domain.Number3;
import org.zerock.domain.Plus;
import org.zerock.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/test/*")
@AllArgsConstructor
public class TestController {
	
	private BoardService service;
	
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
	
	@GetMapping("/test5")
	public void test5() {

	}
	
	@PostMapping("/test6")
	public String test6(Plus plus, Model model) {
		plus.result();
		model.addAttribute("plus", plus);
		return "/test/test7";
	}
	
	@GetMapping("/test8")
	public void test8() {

	}
	
	@PostMapping("/test9")
	public String test9(Compare compare,Model model) {
		compare.result();
		model.addAttribute("compare", compare);
		return "/test/test9";
	}
	
	@GetMapping("/test20")
	public void test20() {
		
	}
	
	@PostMapping("/test20")
	public String test20(int num1, int num2, Model model) {
		int sum = 0;
		for (int i = num1; i <= num2; i++) {
			sum += i;			
		}
		
		model.addAttribute("sum", sum);	// 보낼 때
		return "/test/test21";
	}
	
	@GetMapping("/test22")
	public void test22() {
		
	}
	
	@PostMapping("/test22")
	public String test23(Menu menu, Model model) {
		model.addAttribute("menu", menu);
		menu.result();
		return "/test/test23";		
	}
	
	@GetMapping("/test25")
	public void test25() {
		
	}
	
	@PostMapping("/test25")
	public String test26(int[] menu, Model model) {
		int num = menu.length;
		
		model.addAttribute("num", menu.length);
//		model.addAttribute("num", num); 같은거
		return "/test/test26";
	}

	@GetMapping("/test30")
	public String test30(Model model) {
		model.addAttribute("count", service.scount());
		return "/test/test30";
	}
	
	@GetMapping("/test31")
	public String test31(Model model) {
		model.addAttribute("user", service.user());
		return "/test/test31";
	}
	
	@GetMapping("/test33")
	public void test33() {
	}
	
	@PostMapping("/test34")
	public void test34(String search, Model model) {
		model.addAttribute("search", search);
		model.addAttribute("count", service.count(search));
	}
	
	@GetMapping("/test40")
	public void test40() {
	}
	
	@PostMapping("/test41")
	public void test41(Between between, Model model) {
		model.addAttribute(between);
		model.addAttribute("bcount", service.bcount(between));
	}
	
}
>>>>>>> 442f98c48e220c700b90ea66ff9090a6b01d9012
