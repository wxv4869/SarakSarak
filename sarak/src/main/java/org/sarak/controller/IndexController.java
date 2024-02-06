package org.sarak.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/index/*")
@Controller
public class IndexController {
	
	@GetMapping("/member")
	public void doMember() {
		
		log.info("logined member");
		
	}
	
	@GetMapping("/admin")
	public void doAdmin() {
		
		log.info("admin only");
		
	}
}