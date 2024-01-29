package org.sarak.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AuthorVO {
	
	private int bid;
	
	private int authorid;
	private String authorname;
	private String authordesc;

}
