package org.zerock.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.Criteria;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class GalleryMapperTests {
	
	@Setter(onMethod_= {@Autowired})
	private GalleryMapper mapper;
	
	
	@Test
	public void addTest() {
		
		mapper.addGallery("이렇게 길게 넣으면 너는 못알아보겠지 바부야 캬캬캬캬캬캬캬컄캬캬캬");
		
	}
	
	@Test
	public void readTest() {
		
		mapper.readGallery(1);
	}
	
	@Test
	public void listTest() {
		
		mapper.list(new Criteria(1));
	}
	
	@Test
	public void getCountTest() {
		
		mapper.getCount(new Criteria(1));
	}
	
	@Test
	public void removeTest() {
		mapper.remove(15);
	}
	
}
