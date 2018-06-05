package org.zerock.controller;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.zerock.domain.Criteria;
import org.zerock.domain.GalleryVO;
import org.zerock.domain.PageMaker;
import org.zerock.service.GalleryService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

@Controller
@RequestMapping("/gallery/*")
@Log4j
public class GalleryController {	

	@Setter(onMethod_ = { @Autowired })
	private GalleryService service;

	@GetMapping("/glist/{page}")
	public ResponseEntity<Map<String, Object>> listPage(@PathVariable("page") Integer page) {
		ResponseEntity<Map<String, Object>> entity = null;
		log.info("page..."+page);

		try {
			Criteria cri = new Criteria(page);
			Map<String, Object> map = new HashMap<String, Object>();
			List<GalleryVO> list = service.list(cri);

			map.put("list", list);

			int galCount = service.getCount(cri);

			map.put("pm", new PageMaker(cri, galCount));

			entity = new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);

		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.BAD_REQUEST);
		}

		return entity;
	}
	@GetMapping("/glist")
	public void read() {
		
	}
	
	@GetMapping("/display")
	public @ResponseBody ResponseEntity<byte[]> display(String file)throws Exception{
		
		System.out.println("file " + file);
		
		HttpHeaders headers = new HttpHeaders();
		
		headers.add("Content-Type", "image/jpg");
		
		String filePath = "C:\\zzz\\upload\\" + file;
		
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		
		File target = new File(filePath);
		
		FileCopyUtils.copy(new FileInputStream(target), baos);
		
		ResponseEntity<byte[]> result = 
				new ResponseEntity<>(baos.toByteArray(),headers,
						HttpStatus.OK);
		
		
		return result;
	}
	
	@PostMapping(value="/glist", produces="application/json")
	public @ResponseBody ResponseEntity<List<String>> uploadAjaxFiles(MultipartFile[] file ) throws Exception{
		
		log.info(Arrays.toString(file));
		
		List<String> uploadNames = new ArrayList<String>();
		
		for (MultipartFile upfile : file) {
		
			log.info(upfile.getOriginalFilename());
			log.info("----------------------------");
			
			UUID uid= UUID.randomUUID();
			
			String uploadFileName = uid.toString()+"_"+upfile.getOriginalFilename();
			
			FileOutputStream fos = 
					new FileOutputStream( new File("C:\\zzz\\upload",
						uploadFileName	) );
			
			service.addGallery(uploadFileName);
			
			FileCopyUtils.copy(upfile.getInputStream(), fos);
			fos.close();
			
			//make thumbnail
			
			FileOutputStream thfos = 
				new FileOutputStream(
				 new File("C:\\zzz\\upload", 
						 "s_" + uploadFileName)
				);
			
			Thumbnailator.createThumbnail(
					upfile.getInputStream(), 
					thfos, 120,120);
			thfos.close();
			
			uploadNames.add(uploadFileName);		
		}
		
		return new ResponseEntity<List<String>>(uploadNames, HttpStatus.OK);
		
	}

}
