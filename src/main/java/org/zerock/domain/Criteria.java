package org.zerock.domain;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class Criteria {

	
	private int page;
	private String type;
	private String keyword;
	
	public String[] getArr() {
		
		if(type == null) {
			return null;
		}else {
			return this.type.split("");
		}
	}
	
	
	public Criteria() {
	
		this.page = 1;
	}
	
	public Criteria(int page) {
		this.page =  page;
	}
	
	public int getSkip() {
		
		return (this.page - 1)*10;
	}

	
	
}
