package org.zerock.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.zerock.domain.Criteria;
import org.zerock.domain.PageMaker;
import org.zerock.domain.ReplyVO;
import org.zerock.service.ReplyService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@CrossOrigin
@RestController
@RequestMapping("/reply/*")
@Log4j
public class ReplyController {
	
	@Setter(onMethod_ = { @Autowired })
	private ReplyService service;
	
	@GetMapping("{bno}/{page}")
	public ResponseEntity<Map<String, Object>> listPage(@PathVariable("bno")Integer bno){
		ResponseEntity<Map<String,Object>> entity = null;
		
		try {			
			Criteria cri = new Criteria();
			Map<String,Object> map = new HashMap<String, Object>();
			List<ReplyVO> list = service.list(bno, cri);

			map.put("list", list);
			
			int replyCount = service.Count(bno);
						
			map.put("pm", new PageMaker(cri, replyCount));
			
			entity = new ResponseEntity<Map<String,Object>>(map, HttpStatus.OK);
			
		}catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String,Object>>(HttpStatus.BAD_REQUEST);
		}

		return entity;
	}
	
	

}
