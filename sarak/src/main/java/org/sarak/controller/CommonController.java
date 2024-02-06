package org.sarak.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.sarak.domain.AuthVO;
import org.sarak.domain.MemberVO;
import org.sarak.service.MemberService;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.support.RequestContextUtils;

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
		
		if (auth != null) {
			
	        log.info("Granted Authorities: " + auth.getAuthorities());
	        
	    }
		
		model.addAttribute("msg", "Access Denied");
		
	}
	
	@GetMapping("/register")
	public void getRegister() {
		
		log.info("/register");
		
	}
	
	@PostMapping("/register")
	public String postRegister(MemberVO memberVo, AuthVO authVo) throws Exception {
		
		
		log.info("postRegister : " + memberVo);
		
		String inputPw = memberVo.getMpw();
		
		String encodedPassword = pwdEncoder.encode(inputPw);
		
		memberVo.setMpw(encodedPassword);
		
		authVo.setAuth("ROLE_USER");
		
		memberService.registerMember(memberVo, authVo);
			
		return "redirect:/sarak/main";
		
	}
	
	@GetMapping("/customLogin")
	public void loginInput(String error, String logout, Model model, HttpServletRequest request) {
		
	    log.info("error : " + error);
	    
	    log.info("logout : " + logout);
	    
	    if (error == null && logout == null) {
	    	
	        String uri = request.getHeader("Referer");
	        
	        if (uri == null) {
	            
	            Map<String, ?> paramMap = RequestContextUtils.getInputFlashMap(request);
	            
	            uri = (String) paramMap.get("referer");
	            
	        }
	        
	        request.getSession().setAttribute("prevPage", uri);
	        
	    }

	    if (error != null) {
	    	
	        model.addAttribute("error", "Login Error Check Your Account");
	        
	    }

	    if (logout != null) {
	    	
	        model.addAttribute("logout", "Logout!!");
	        
	    }
	    
	}
	
	@GetMapping("/customLogout")
	public void logoutGET() {
		
		log.info("/customLogout");
		
	}
	
}