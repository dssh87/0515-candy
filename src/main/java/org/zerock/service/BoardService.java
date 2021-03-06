package org.zerock.service;

import java.util.List;

import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;

public interface BoardService {

	public List<BoardVO> list(Criteria cri);
	public int getCount(Criteria cri);
	public BoardVO view(int bno);
	public int remove(int bno);
	public int insert(BoardVO vo);
	public int modify(BoardVO vo);
	
	public void updateReplyCnt(Integer bno, Integer amount);
}
