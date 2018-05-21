package org.zerock.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;

import lombok.Setter;
import lombok.extern.log4j.Log4j;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardMapperTests {

	@Setter(onMethod_= {@Autowired})
	private BoardMapper mapper;
	
	@Test
	public void testList() {
		
		mapper.list(new Criteria(7));
		
	}
	
	@Test
	public void testView() {
		
		mapper.view(3);
	}
	@Test
	public void testInsert() {
		BoardVO vo = new BoardVO();
		vo.setTitle("진주");
		vo.setContent("원기");
		vo.setWriter("바보");
		
		mapper.insert(vo);
	}
	
	@Test
	public void testRemove() {
		
		mapper.remove(1507334);
	}
	
	@Test
	public void testModify() {
		BoardVO vo = new BoardVO();
		
		vo.setBno(1507382);
		vo.setTitle("상현");
		vo.setContent("원기");
		vo.setWriter("바보");
				
		mapper.modify(vo);
	}
}
