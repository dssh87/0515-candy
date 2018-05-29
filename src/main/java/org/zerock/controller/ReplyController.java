package org.zerock.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
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
	
	@GetMapping("/{bno}/{page}")
	public ResponseEntity<Map<String, Object>> listPage(@PathVariable("bno")Integer bno, @PathVariable("page") Integer page){
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
	
	@PostMapping("/new")
	public ResponseEntity<String> register(@RequestBody ReplyVO vo){
		ResponseEntity <String> entity = null;
		try {
		service.insert(vo);
		entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		
	}catch (Exception e) {
		e.printStackTrace();
		entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
	}

	return entity;
		
	}
	
	@GetMapping("/{rno}")
	public ResponseEntity<ReplyVO> view(@PathVariable("rno")Integer rno){
		
		
		return new ResponseEntity<ReplyVO>( service.view(rno), HttpStatus.OK);
		
		
	}
	
	@DeleteMapping("/{rno}")
	public ResponseEntity<String> remove(
			@PathVariable("rno")Integer rno){
		
		String msg =  service.remove(rno) == 1?"success":"fail";
		
		return new ResponseEntity<String>(msg, HttpStatus.OK);
		
		
	}
	
	
	@PutMapping("/{rno}")
	public ResponseEntity<String> modify(
			@PathVariable("rno")Integer rno, @RequestBody ReplyVO vo){
		
		vo.setRno(rno);
		
		String msg =  service.modify(vo) == 1?"success":"fail";
		
		return new ResponseEntity<String>(msg, HttpStatus.OK);
		
		
	}
	
}
