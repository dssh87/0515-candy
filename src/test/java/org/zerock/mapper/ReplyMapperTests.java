package org.zerock.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.Criteria;
import org.zerock.domain.ReplyVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReplyMapperTests {
	
	@Setter(onMethod_= {@Autowired})
	private ReplyMapper reply;
	
	@Test
	public void testReply() {
		
		reply.list(1507430,new Criteria(6));		
		
	}
	@Test
	public void testCount() {
		reply.getCount(1507430);
	}
	
	@Test
	public void testView() {
		reply.view(100);
	}
	
	@Test
	public void testUpdate() {
		ReplyVO vo = new ReplyVO();
		vo.setRno(100);
		vo.setRcontent("바보");
		vo.setReplyer("진주");
		
		reply.modify(vo);
	}
	@Test
	public void testRemove() {
		reply.remove(100);
	}
	

}
