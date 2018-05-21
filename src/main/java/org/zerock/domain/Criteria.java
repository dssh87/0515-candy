package org.zerock.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Data;
import lombok.Getter;
import lombok.extern.log4j.Log4j;

@Data
@Getter
@Log4j
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

	public String getLink(String path) {
		
		UriComponentsBuilder builder2 = UriComponentsBuilder.fromPath(path);
		builder2.queryParam("page", this.page);
		if(this.type != null) {
		builder2.queryParam("type", this.type);
		}
		if(this.keyword != null) {
		builder2.queryParam("keyword", this.keyword);
		}
		
		String str = builder2.toUriString();
		
		log.info("-------------------------------------------");
		log.info(str);		
		return str;
	}
}
