package org.zerock.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	public void list(@ModelAttribute("cri") Criteria cri, Model model) throws Exception {

		model.addAttribute("list", service.list(cri));

		int totalCount = service.getCount(cri);
		model.addAttribute("pm", new PageMaker(cri, totalCount));

	}

	@GetMapping("register")
	public void registerGet(@ModelAttribute("cri") Criteria cri) {

	}

	@PostMapping("register")
	public String registerPost(@ModelAttribute("vo") BoardVO vo, RedirectAttributes rttr) throws Exception {
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
	public void view(@ModelAttribute("cri") Criteria cri, Integer bno, Model model) {
		model.addAttribute("view", service.view(bno));
		model.addAttribute("pm", new PageMaker(cri));
	}

	@PostMapping("remove")
	public String remove(@RequestParam("bno") int bno, @ModelAttribute("cri") Criteria cri, String makeUri,
			RedirectAttributes rttr) {

		log.info("아무말...." + makeUri);
		service.remove(bno);

		rttr.addAttribute("page", cri.getPage());
		rttr.addFlashAttribute("msg", "remove");

		return "redirect:/board/list?" + makeUri;

		
	}
	
	@GetMapping("modify")
	public void getmodify(@ModelAttribute("cri")Criteria cri, Integer bno, Model model) {
		model.addAttribute("view",service.view(bno));		
		



	}




	@PostMapping("modify")
	public String postmodify(@ModelAttribute("vo") BoardVO vo, RedirectAttributes rttr,
			@ModelAttribute("cri") Criteria cri) {

		log.info("아무거나요................" + vo);
		log.info("CRI..." + cri);

		service.modify(vo);



		rttr.addAttribute("bno", vo.getBno());
		rttr.addAttribute("page", cri.getPage());

		rttr.addFlashAttribute("msg", "modify");

		return "redirect:" + cri.getLink("/board/view");


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
}
