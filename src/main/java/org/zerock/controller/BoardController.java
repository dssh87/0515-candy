package org.zerock.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.zerock.domain.Criteria;
import org.zerock.domain.PageMaker;
import org.zerock.service.BoardService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;



@Controller
@RequestMapping("/board/*")
@Log4j
public class BoardController {
	

	@Setter(onMethod_ = { @Autowired })
	private BoardService service;

	@GetMapping("/list")
	public void list(@ModelAttribute("cri") Criteria cri, Model model) {

		model.addAttribute("list",service.list(cri));

		int totalCount = service.getCount(cri);

		model.addAttribute("pm", new PageMaker(cri, totalCount));

	}
	
	@GetMapping("/register")
	public void register() {
		
	}
}
