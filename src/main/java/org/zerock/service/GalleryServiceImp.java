package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.Criteria;
import org.zerock.domain.GalleryVO;
import org.zerock.mapper.GalleryMapper;

import lombok.Setter;

@Service
public class GalleryServiceImp  implements GalleryService {

	@Setter(onMethod_= {@Autowired})
	private GalleryMapper mapper;
	
	
	@Override
	public void addGallery(String fullName) {
	
		mapper.addGallery(fullName);
		
	}


	@Override
	public GalleryVO readGallery(Integer gno) {
		
		
		return mapper.readGallery(gno);
	}


	@Override
	public List<GalleryVO> list(Criteria cri) {
		
		return mapper.list(cri);
	}


	@Override
	public int getCount(Criteria cri) {
		
		return mapper.getCount(cri);
	}


	@Override
	public int remove(int gno) {

		return mapper.remove(gno);
	}

}
