package org.sarak.controller;

import java.util.List;

import org.sarak.domain.Criteria;
import org.sarak.domain.MemberVO;
import org.sarak.domain.OrderCancelDTO;
import org.sarak.domain.OrderDTO;
import org.sarak.domain.PageDTO;
import org.sarak.service.MemberService;
import org.sarak.service.OrderService;
import org.springframework.security.access.prepost.PreAuthorize;
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

@Controller
@Log4j
@RequestMapping("/mypage/*")
@AllArgsConstructor
public class MypageController {
	
	private MemberService memberService;
	
	private OrderService orderService;
	
	private BCryptPasswordEncoder pwdEncoder;
	
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/orderList")
	public void orderList(@RequestParam("mid") String mid, Criteria cri, Model model) {
		
		List<OrderDTO> list = orderService.getOrderList(cri);
		
		if(!list.isEmpty()) {
			
			model.addAttribute("list", list);
			
			log.info(cri);
			
			int total = orderService.getOrderTotal(cri);
			
			log.info(total);
			
			model.addAttribute("pageMaker", new PageDTO(cri, total));
			
		} else {
			
			model.addAttribute("listCheck", "empty");
			
		}
		
		log.info("/get");
		
		log.info(memberService.get(mid));
		
		model.addAttribute("member", memberService.get(mid));
		
	}
	
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/orderDetail")
	public void orderDetail(@RequestParam("orderid") String orderid, Criteria cri, Model model) {

		OrderDTO dto = orderService.orderComplete(orderid);
		
		log.info("/orderDetail");
		
		model.addAttribute("cri", cri);
		
		model.addAttribute("orderstate", dto.getOrderstate());
		
		model.addAttribute("orderItem", dto);

	}
	
	
	
	@PreAuthorize("isAuthenticated()")
	@GetMapping({"/profile", "/profileModify", "/passwordModify"})
	public void get(@RequestParam("mid") String mid, Model model) {
		
		log.info("/profile");
		
		log.info(memberService.get(mid));
		
		model.addAttribute("member", memberService.get(mid));
		
	}
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/profileModify")
	public String modify(MemberVO member, RedirectAttributes rttr) {
		
		log.info("profileModify : " + member);
		
		if(memberService.modifyMember(member)) {
			
			rttr.addFlashAttribute("result", "회원 정보가 수정되었습니다.");
			
		}
		
		return "redirect:/mypage/profile?mid="+member.getMid();
				
	}
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/passwordModify")
	public String modifyAuth(MemberVO member, RedirectAttributes rttr) {
		
		log.info("passwordModify : " + member);
		
		String inputPw = member.getMpw();
		
		String encodedPassword = pwdEncoder.encode(inputPw);
		
		log.info(encodedPassword);
		
		member.setMpw(encodedPassword);
		
		if(memberService.modifyPassword(member)) {
			
			rttr.addFlashAttribute("result", "회원 비밀번호가 수정되었습니다.");
			
		}
		
		return "redirect:/mypage/profile?mid="+member.getMid();
	}
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/orderCancle")
	public String orderCancelPost(OrderCancelDTO ocd) {
		
		orderService.orderCancel(ocd);
		
		log.info(ocd);
		
		return "redirect:/mypage/orderDetail?mid=" + ocd.getMid() + "&pageNum=" + ocd.getPageNum() + "&amount=" + ocd.getAmount() + "&orderid=" + ocd.getOrderid();
	
	}

}