package org.zerock.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.Criteria;
import org.zerock.service.GalleryService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class GalleryServiceTests {
	

	@Setter(onMethod_= {@Autowired})
	private GalleryService service;

	
	@Test
	public void addTest() {
		
		service.addGallery("한번 더 길게 적어볼건데 duddjfh dlfjgrp Tmaus ahtdkfdkqhfRJwl??? zizizizizi");
		
	}

	@Test
	public void readTest() {
		
		service.readGallery(1);
	}
	
	@Test
	public void listTest() {
		
		service.list(new Criteria(1));
	}
	
	@Test
	public void getCountTest() {
		
		service.getCount(new Criteria(1));
	}
	
	@Test
	public void removeTest() {
		service.remove(16);
	}
}

