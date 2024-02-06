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
public class CartDTO {
	
	private int cartid;
	private String mid;
	private int bid;
	private int cartquan;
	private Date cartdate;
	
	private String bname;
	private int bprice;
	
	private String filename;
	private String uploadpath;
	
	private List<BookAttachVO> attachList;

}
