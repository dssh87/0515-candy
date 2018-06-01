package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.zerock.domain.Criteria;
import org.zerock.domain.ReplyVO;

public interface ReplyMapper {

	public List<ReplyVO> list(@Param("bno") Integer bno, @Param("cri") Criteria cri);

	public int getCount(Integer bno);

	public int insert(ReplyVO vo);

	public ReplyVO view(Integer rno);

	public int modify(ReplyVO vo);

	public int remove(Integer rno);
	
	public int getBno(Integer rno);

}
