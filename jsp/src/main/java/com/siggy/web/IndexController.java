package com.siggy.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class IndexController {
	@Autowired
	private BoardService boardService;
	
	
	@GetMapping(value= {"/","/index"})
	public String index() {
		return "index";
	}
	
	
	@GetMapping("/board")
	public ModelAndView board() {
		ModelAndView mv = new ModelAndView("board");
		
		//전체 글 수 뽑아보기
		int toSize = boardService.toSize();
		mv.addObject("toSize", toSize);
		return mv;
	}
}
