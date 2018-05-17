package org.zerock.domain;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
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
			builder.append(cri.getKeyword());
		}
		
		return builder.toString();
		
	}
	
}
