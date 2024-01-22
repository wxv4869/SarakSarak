package org.sarak.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BookVO {

	private int bid;
	private String bname;
	private int bprice;
	private String isbn;
	private String pubdate;
	private String publisher;
	private int authorid;
	private String summary;
	private String contents;
	
}
