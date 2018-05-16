package org.zerock.domain;

import java.util.Date;

import lombok.Data;

@Data
public class BoardVO {

	private Integer bno;
	private String title, content, writer;
	private Date regdate, updatedate;
	
	private static final Long ADAY = 1000*60*60*24L;
	
	public boolean checkNew() {
		
		long gap = new Date().getTime() - regdate.getTime();
		
		return gap < ADAY;

		// 실시간

		
		
		
		//hello World~~~~~~~!!^00^

		// 등록일 수정

		// 실시간 녹화방송
		
		//poohpoohpooh 원투쓰리 첵첵

		
		//방가방가햄토리

	}
}
