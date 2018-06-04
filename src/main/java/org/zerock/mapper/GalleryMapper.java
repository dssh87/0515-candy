package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.zerock.domain.Criteria;
import org.zerock.domain.GalleryVO;

public interface GalleryMapper {
	
	public void addGallery(String fullName);

	public GalleryVO readGallery(Integer gno);
	
	public List<GalleryVO> list(@Param("cri") Criteria cri);
	
	public int getCount(Criteria cri);
}
