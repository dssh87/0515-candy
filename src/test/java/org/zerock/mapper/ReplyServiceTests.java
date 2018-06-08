package org.zerock.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.Criteria;
import org.zerock.domain.ReplyVO;
import org.zerock.service.ReplyService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReplyServiceTests {

	@Setter(onMethod_= {@Autowired})
	private ReplyService service;
	@Setter(onMethod_= {@Autowired})
	private BoardMapper mapper;
	
	@Test
	public void testList() {
		service.list(1507430, new Criteria(1));
	}
	@Test
	public void testCount() {
		service.Count(1507430);
	}
	@Test
	public void testView() {
		service.view(100);
	}
	
	@Test
	public void testUpdate() {
		ReplyVO vo = new ReplyVO();
		vo.setRno(100);
		vo.setRcontent("cjswo");
		vo.setReplyer("진주");
		
		service.modify(vo);
	}
	@Test
	public void testRemove() {
		service.remove(100);
	}
	
	@Test
	public void testAddReply() {
		mapper.updateReplyCnt(1, 1);
		ReplyVO vo = new ReplyVO();
		
		vo.setBno(1);
		vo.setRcontent("되나");
		vo.setReplyer("들어가");
		
		service.insert(vo);
	}
	
}
