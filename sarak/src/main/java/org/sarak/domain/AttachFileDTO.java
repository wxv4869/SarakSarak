package org.sarak.domain;

import lombok.Data;

@Data
public class AttachFileDTO {
	
	private int bid;
	private String filename;
	private String uploadpath;

}
