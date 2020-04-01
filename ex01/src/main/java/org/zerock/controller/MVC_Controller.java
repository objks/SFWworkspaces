package org.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MVC_Controller {
	@RequestMapping("/ex05")
	public void ex05() {
		
	}
	
	@RequestMapping("/ex06")
	public String ex06() {
		return "redirect:abc.jsp";	// abc.jsp ¿­¸°´Ù.
	}
	
	@RequestMapping("/abc")
	public void ex07() {
	}
	
	@RequestMapping("/test3")
	public void ex08(Model model) {
		ProductVO product = new ProductVO();
		product.setCount(100);
		product.setName("sample P");
		model.addAttribute("prod",product);
	}
	
	@RequestMapping("/test4")
	public ProductVO ex08() {
		ProductVO product = new ProductVO();
		product.setCount(100);
		product.setName("sample P");
		return product;
	}
	
	@RequestMapping("/form")
	public void form() {	}
	
	@RequestMapping("/ex01")
	public void ex01(SampleDTO dto) {
		System.out.println(dto.getName());
		System.out.println(dto.getNum1()+dto.getNum2());		
	}
	
	
}
