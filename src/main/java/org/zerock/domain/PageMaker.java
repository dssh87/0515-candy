package org.zerock.domain;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import lombok.Data;
import lombok.ToString;
import lombok.extern.log4j.Log4j;

@ToString
@Data
@Log4j
public class PageMaker {

	private boolean prev, next;

	private int page, start, end, total;

	private Criteria cri;

	private static int parse(String str) {

		try {
			return Integer.parseInt(str);
		} catch (Exception e) {
			return 1;
		}
	}

	public PageMaker(Criteria cri, int total) {

		this.cri = cri;
		this.total = total;

		this.page = cri.getPage() > 0 ? cri.getPage() : 1;

		int tempLast = (int) (Math.ceil(page / 10.0) * 10);

		this.start = tempLast - 9;

		prev = (start != 1);

		if (tempLast * 10 >= total) {
			tempLast = (int) (Math.ceil(total / 10.0));
		} else {
			this.next = true;
		}
		this.end = tempLast;
	}
	
	public String makeURL(int page) {		
		
		StringBuilder builder = new StringBuilder();
		
		builder.append("page=");
		builder.append(page);
		
		if(cri.getType() !=null) {
			builder.append("&");
			builder.append("type=");
			builder.append(cri.getType());
		}
		
		if(cri.getKeyword() !=null) {
			builder.append("&");
			builder.append("keyword=");
			builder.append(encoding(cri.getKeyword()));
		}

		return builder.toString();
	}
	private String encoding(String keyword) {
		
		if(keyword ==null || keyword.trim().length()==0) {
			return "";
		}try {
			return URLEncoder.encode(keyword,"UTF-8");
		}catch (UnsupportedEncodingException e) {
			return "";
		}
	}
	public String makeQuery(int page) {
		UriComponents uriComponents=
		UriComponentsBuilder.newInstance().queryParam("page",page).build();
		return uriComponents.toUriString();
		
	}
	
}
