package org.zerock.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.BoardVO;
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

	@GetMapping("list")
	public void list(@ModelAttribute("cri") Criteria cri, Model model) throws Exception{

		model.addAttribute("list",service.list(cri));

		int totalCount = service.getCount(cri);
		model.addAttribute("pm", new PageMaker(cri, totalCount));

	}
	@GetMapping("register")
	public void registerGet() {
		
	}
	
	@PostMapping("register")
	public String registerPost(@ModelAttribute("vo")BoardVO vo, RedirectAttributes rttr) throws Exception {
        log.info("register Post..................");
                
        String title = vo.getTitle();

		if (title != null && title.trim().length() != 0) {
			service.insert(vo);
			rttr.addFlashAttribute("msg", "success");
		} else {

			rttr.addFlashAttribute("msg", "fail");
		}
        
        return "redirect:/board/list";
		
	}
	
	@GetMapping("view")
	public void view(@ModelAttribute("cri")Criteria cri, Integer bno, Model model) {
		model.addAttribute("view",service.view(bno));		
	}
	@GetMapping("index")
	public void index() {
		
	}
	@GetMapping("generic")
	public void generic() {
		
	}
	@GetMapping("elements")
	public void elements() {
		
	}
	@PostMapping("remove")
	public String remove(@ModelAttribute("bno")int bno, RedirectAttributes rttr) {
		
		service.remove(bno);
		
		rttr.addFlashAttribute("msg","success");
		
		return "redirect:/board/list";
		
		
	}
}
