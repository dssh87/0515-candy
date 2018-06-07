package org.zerock.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.zerock.domain.Criteria;
import org.zerock.domain.GalleryVO;

public interface GalleryService {

	
	public void addGallery(String fullName);
	

	public GalleryVO readGallery(Integer gno);

	public List<GalleryVO> list(@Param("cri") Criteria cri);
	
	public int getCount(Criteria cri);
	
	public int remove(int gno);
}
