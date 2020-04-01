package org.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/board/*")
@AllArgsConstructor			// lombok에서 제공하는! 24번째 줄의 객체 생성을 위한 것
public class BoardController {
	
	private BoardService service;		// 요기

	@GetMapping("/list")
	public void list(Criteria cri, Model model) {
		log.info("ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ 리스트 처리 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ");
		model.addAttribute("list", service.getList(cri));
		
	}
	
	@GetMapping("/register")
	public void register() {
		
	}
	
	@PostMapping("/register") 
		public String register(BoardVO board, RedirectAttributes rttr) {
		log.info("ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ글 등록처리 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ" + board);
		service.register(board);
		rttr.addFlashAttribute("result", board.getBno());
		return "redirect:/board/list";
	}
	
	
	@GetMapping({"/get", "/modify"})
	public void get(@RequestParam("bno") long bno, Model model) {
		log.info("ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ글 조회 or 수정 요청 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ");
		model.addAttribute("board", service.get(bno));
	}
		
	
	@PostMapping("/modify") 
	public String modify(BoardVO board, RedirectAttributes rttr) {
	log.info("ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ글 수정처리 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ" + board);
	
	if(service.modify(board)) {
		rttr.addFlashAttribute("result", "success");
	}
	
	return "redirect:/board/list";
	}

	@PostMapping("/remove") 
	public String remove(@RequestParam("bno") Long bno, RedirectAttributes rttr) {
	log.info("ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ 글 삭제처리 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ" + bno);
	
	if(service.remove(bno)) {
		rttr.addFlashAttribute("result", "success");
	}
	
	return "redirect:/board/list";
	}
	
}
