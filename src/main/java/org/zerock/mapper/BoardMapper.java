package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;

public interface BoardMapper {

	public List<BoardVO> list(Criteria cri);
	public int getCount(Criteria cri);
	public BoardVO view(int bno);
	public int remove(int bno);
	public int insert(BoardVO vo);
	public int modify(BoardVO vo);
	
	public void updateReplyCnt(@Param("bno")Integer bno, @Param("amount")Integer amount);
}
