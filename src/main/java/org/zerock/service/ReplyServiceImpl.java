package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.Criteria;
import org.zerock.domain.ReplyVO;
import org.zerock.mapper.BoardMapper;
import org.zerock.mapper.ReplyMapper;

import lombok.Setter;
@Service
public class ReplyServiceImpl implements ReplyService {

	@Setter(onMethod_= {@Autowired})
	private ReplyMapper reply;
	
	@Override
	public List<ReplyVO> list(Integer bno, Criteria cri) {

		return reply.list(bno, cri);
	}

	@Override
	public int Count(Integer bno) {

		return reply.getCount(bno);
	}

}
