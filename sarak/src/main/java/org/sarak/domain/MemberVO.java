package org.sarak.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class MemberVO {
	
	private String mid; 
	private String mpw;
	private String mname;
	private String phone;
	private String email;
	private String postcode;
	private String address;
	private Date mregdate;
	
	private List<AuthVO> authList;
	
	private AuthVO auth;

    public AuthVO getAuth() {
        return auth;
    }

    public void setAuth(AuthVO auth) {
        this.auth = auth;
    }

}