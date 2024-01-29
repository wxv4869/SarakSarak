package org.sarak.controller;

import org.sarak.domain.AuthVO;
import org.sarak.domain.MemberVO;
import org.sarak.service.MemberService;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@AllArgsConstructor
public class CommonController {
	
	private MemberService memberService;
	
	private BCryptPasswordEncoder pwdEncoder;
	
	@GetMapping("/accessError")
	public void accessDenied(Authentication auth, Model model) {
		
		log.info("access Denied : " + auth);
		
		model.addAttribute("msg", "Access Denied");
		
	}
	
	@GetMapping("/register")
	public void getRegister() {
		
		log.info("get register...");
		
	}
	
	@PostMapping("/register")
	public String postRegister(MemberVO memberVo, AuthVO authVo) throws Exception{
		
		log.info("post register..." + memberVo);
		
		String inputPw = memberVo.getMpw();
			
		String encodedPassword = pwdEncoder.encode(inputPw);
			
		memberVo.setMpw(encodedPassword);
			
		authVo.setAuth("ROLE_USER");
			
		memberService.registerMember(memberVo, authVo);
			
		return "redirect:/index/main";
		
	}
	
	@GetMapping("/customLogin")
	public void loginInput(String error, String logout, Model model) {
		
		log.info("error : " + error);
		
		log.info("logout : " + logout);
		
		if(error != null) {
			
			model.addAttribute("error", "Login Error Check Your Account");
		
		} 
		
		if(logout != null) {
			
			model.addAttribute("logout", "Logout!!");
			
		} 
	}
	
	@GetMapping("/customLogout")
	public void logoutGET() {
		
		log.info("custom logout");
		
	}
	
}