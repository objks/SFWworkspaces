package org.zerock.controller;

import java.util.Calendar;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

// GetServer Uri가 get타입으로 요청되면 초를 텍스트로 응답하는 컨트롤러

@Controller
public class AjaxController {
	
	@GetMapping("/jQuery/ajax")
	public void ajax() {
	}
	
	
	@GetMapping("/GetServer")
	@ResponseBody
	public String second() {
	    Calendar calendar=Calendar.getInstance();
	    int second=calendar.get(Calendar.SECOND);
	    System.out.println(second);
	    String str = Integer.toString(second);	// 현재 시간의 초를 문자로 만들었음
		return str;
	}
	
}
