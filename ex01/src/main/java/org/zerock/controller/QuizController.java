package org.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.zerock.domain.Number;

@Controller
public class QuizController {
	@RequestMapping("/input1")
	public void sum() {
		//input1.jsp ��û
	}
	
	@RequestMapping("/add")
	public String add(@RequestParam("num1") int num1, @RequestParam("num2") int num2, Model model) {
		int sum = num1 + num2;
		model.addAttribute("num1", num1);
		model.addAttribute("num2", num2);
		model.addAttribute("sum", sum);
		return "sum";
		//sum.jsp ��û
	}
	
	@RequestMapping("add1")
	public String add1(Number number, Model model) {
		number.exec();
		// result���� number�� �Ἥ ���� �� ����.
//		model.addAttribute(number);
		model.addAttribute("result", number);
		
		return "sum1";
	}
	
	
}
