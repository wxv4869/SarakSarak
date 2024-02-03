package org.sarak.controller;

import java.util.List;

import org.sarak.domain.AuthVO;
import org.sarak.domain.AuthorVO;
import org.sarak.domain.Criteria;
import org.sarak.domain.MemberVO;
import org.sarak.domain.PageDTO;
import org.sarak.service.AuthorService;
import org.sarak.service.MemberService;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	
	private AuthorService authorService;
	
	private BCryptPasswordEncoder pwdEncoder;

	// member 관련 시작
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

	/* 작가 목록 페이지 */
	@Secured({"ROLE_ADMIN"})
	@GetMapping("/authorlist")
	public void doAuthorList(Criteria cri, Model model) throws Exception {
		
		log.info("###### 작가 목록 페이지 진입 ######");
		
		List authorlist = authorService.authorGetList(cri);
		
		model.addAttribute("authorlist", authorlist);
		
		model.addAttribute("pageMaker", new PageDTO(cri, authorService.authorGetTotal(cri)));
		
	}
	
	/* 작가 상세 페이지 */
	@Secured({"ROLE_ADMIN"})
	@GetMapping({"/authorget", "/authormodify"})
	public void authorGet(int authorid, Criteria cri, Model model) throws Exception {
		
		log.info("###### 작가 상세 페이지" + authorid);
		
		model.addAttribute("cri", cri);
		
		model.addAttribute("author", authorService.authorGetDetail(authorid));
		
	}
	
	/* 작가 등록 페이지 */
	@Secured({"ROLE_ADMIN"})
	@GetMapping("/authorinsert")
	public void authorInsertGet() {
		
	}
	
	/* 작가 등록 */
	@Secured({"ROLE_ADMIN"})
	@PostMapping("/authorinsert")
	public String authorInsertPost(AuthorVO author, RedirectAttributes rttr) throws Exception {
		
		log.info("authorInsert : " + author);
		
		authorService.authorInsert(author);
		
		rttr.addFlashAttribute("insert_result", author.getAuthorname());
		
		return "redirect:/admin/authorlist";
		
	}
	
	/* 작가 수정 처리 */
	@Secured({"ROLE_ADMIN"})
	@PostMapping("/authormodify")
	public String authorModifyPost(AuthorVO author, RedirectAttributes rttr) throws Exception {
		
		log.info("authotModifyPost....." + author);
		
		int result = authorService.authorModify(author);
		
		rttr.addFlashAttribute("modify_result", result);
		
		return "redirect:/admin/authorlist";
		
	}
	
	/* 작가 삭제 처리 */
	@Secured({"ROLE_ADMIN"})
	@PostMapping("/authordelete")
	public String authorDeletePost(int authorid, RedirectAttributes rttr) throws Exception {
		
		log.info("authorDeletePost.....");
		
		int result = 0;
		
		try {
			
			result = authorService.authorDelete(authorid);
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
			result = 2;
			
			rttr.addFlashAttribute("delete_result", result);
			
			return "redirect:/admin/authorlist";
			
		}
		
		rttr.addFlashAttribute("delete_result", result);
		
		return "redirect:/admin/authorlist";
		
	}
	
}
