package org.sarak.domain;

import java.util.List;

import lombok.Data;

@Data
public class BookAttachVO {
	
	private int bid;
	private String filename;
	private String uploadpath;

	public String getUploadpath() {
        return uploadpath;
    }

    public void setUploadpath(String uploadpath) {
        this.uploadpath = uploadpath;
    }
    
    private List<BookAttachVO> attachList;
}
