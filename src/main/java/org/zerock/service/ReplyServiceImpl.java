package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.Criteria;
import org.zerock.domain.ReplyVO;
import org.zerock.mapper.BoardMapper;
import org.zerock.mapper.ReplyMapper;

import lombok.Setter;
@Service
public class ReplyServiceImpl implements ReplyService {

	@Setter(onMethod_= {@Autowired})
	private ReplyMapper reply;
	
	@Setter(onMethod_= {@Autowired})
	private BoardMapper mapper;
	
	@Override
	public List<ReplyVO> list(Integer bno, Criteria cri) {

		return reply.list(bno, cri);
	}

	@Override
	public int Count(Integer bno) {

		return reply.getCount(bno);
	}

	
	/*@Override
	public int insert(ReplyVO vo) {
		
		return reply.insert(vo); 
	}*/

	@Override
	public ReplyVO view(Integer rno) {

		return reply.view(rno);
	}

	@Override
	public int modify(ReplyVO vo) {

		return reply.modify(vo);
	}

	/*@Override
	public int remove(Integer rno) {

		return reply.remove(rno);
	}*/
	
	@Transactional
	@Override
	public void insert(ReplyVO vo) {
		mapper.updateReplyCnt(vo.getBno(), 1);
		reply.insert(vo); 
	}
	@Transactional
	@Override
	public void remove(Integer rno) {

		int bno = reply.getBno(rno);
		reply.remove(rno);
		mapper.updateReplyCnt(bno, -1);
	}


}
