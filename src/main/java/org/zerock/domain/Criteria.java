package org.zerock.domain;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
public class Criteria {

	private int page;
	
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
