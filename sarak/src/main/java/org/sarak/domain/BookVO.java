package org.sarak.domain;

import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Component
public class BookVO {

	private int bid;
	private String bname;
	private int bprice;
	private String isbn;
	private Date pubdate;
	private String publisher;
	private int authorid;
	private String authorname;
	private String summary;
	private String contents;
	
	private String mainimg;
	private String detailimg;
	
	private List<BookAttachVO> attachList;
	
	public String getAuthorname() {
		return authorname;
	}
	
	public void setAuthorname(String authorname) {
		this.authorname = authorname;
	}
	
}
