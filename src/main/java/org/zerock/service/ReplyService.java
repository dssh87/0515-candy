package org.zerock.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.zerock.domain.Criteria;
import org.zerock.domain.ReplyVO;

public interface ReplyService {

	public List<ReplyVO> list(@Param("bno") Integer bno, @Param("cri") Criteria cri);

	public int Count(Integer bno);

}
