package org.zerock.domain;

import java.util.Date;

import lombok.Data;
import lombok.Getter;

@Data
@Getter
public class GalleryVO {
	
	private Integer gno;
	private String fullName;
	private Date regdate;

}
