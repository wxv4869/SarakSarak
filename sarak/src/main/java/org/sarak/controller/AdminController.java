package org.sarak.controller;

import org.sarak.domain.AuthVO;
import org.sarak.domain.MemberVO;
import org.sarak.service.MemberService;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/admin/*")
@Controller
@AllArgsConstructor
public class AdminController {
	
	private MemberService memberService;
	
	private BCryptPasswordEncoder pwdEncoder;

	@Secured({"ROLE_ADMIN"})
	@GetMapping("/memberlist")
	public void doMemberList(Model model) {
		
		log.info("/memberlist");
		
		model.addAttribute("memberlist", memberService.getList());
	
	}
	
	@Secured({"ROLE_ADMIN"})
	@GetMapping({"/memberget", "/membermodify", "authmodify"})
	public void get(@RequestParam("mid") String mid, Model model) {
		
		log.info("/get");
		
		model.addAttribute("member", memberService.get(mid));
	
	}
	
	@Secured({"ROLE_ADMIN"})
	@PostMapping("/membermodify")
	public String modify(MemberVO member, RedirectAttributes rttr) {
		
		log.info("modify : " + member);
		
		// String inputPw = member.getMpw();
		//		String encodedPassword = pwdEncoder.encode(inputPw);
		//		log.info(encodedPassword);
		//		member.setMpw(encodedPassword);
		
		if(memberService.modifyMember(member)) {
			
			rttr.addFlashAttribute("result", "회원 정보가 수정되었습니다.");
		
		}
		
		return "redirect:/admin/memberlist";
				
	}
	
	@Secured({"ROLE_ADMIN"})
	@PostMapping("/authmodify")
	public String modifyAuth(AuthVO auth, RedirectAttributes rttr) {
		
		log.info("modifyAuth : " + auth);
		
		if(memberService.modifyAuth(auth)) {
			
			rttr.addFlashAttribute("result", "회원 권한이 수정되었습니다.");
		
		}
		
		return "redirect:/admin/memberlist";
		
	}
	
	@Secured({"ROLE_ADMIN"})
	@PostMapping("/memberremove")
	public String remove(@RequestParam("mid") String mid, RedirectAttributes rttr) {
		
		log.info("remove : " + mid);
		
		if(memberService.removeMember(mid)) {
		
			rttr.addFlashAttribute("result", "회원이 탈퇴 되었습니다.");
		
		}
		
		return "redirect:/admin/memberlist";
		
	}
	
}
