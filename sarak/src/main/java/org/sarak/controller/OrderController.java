package org.sarak.controller;

import javax.servlet.http.HttpServletRequest;

import org.sarak.domain.OrderDTO;
import org.sarak.domain.OrderPageDTO;
import org.sarak.service.MemberService;
import org.sarak.service.OrderService;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/sarak/*")
@AllArgsConstructor
public class OrderController {
	
	private OrderService orderService;
	
	private MemberService memberService;
	
	@PreAuthorize("isAuthenticated()")
	@RequestMapping(value="/order", method = RequestMethod.GET)
	public String orderPageGET(String mid, OrderPageDTO opd, Model model, HttpServletRequest request, RedirectAttributes re) {
		
		log.info("mid : " + mid);
		log.info("orders :" + opd.getOrders());
		
		if( memberService.get(mid)== null) {
			
			String uri = request.getHeader("Referer");
			
			re.addFlashAttribute("referer", uri);
			
			return "redirect:/customLogin";
			
		} else {
			
			model.addAttribute("orderList", orderService.getBooksInfo(opd.getOrders()));
			
			model.addAttribute("memberInfo", memberService.get(mid));
			
			return "/sarak/order";
			
		}
		
	}
	
	@PreAuthorize("isAuthenticated()")
//	@PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_USER')")
	@PostMapping("/order")
	public String orderPagePost(OrderDTO od, HttpServletRequest request, RedirectAttributes redirectAttributes) {
		
		log.info(od);
		
		orderService.order(od);
		
		redirectAttributes.addAttribute("orderid", od.getOrderid());
		
		return "redirect:/sarak/orderComplete";
		
	}
	
	@PreAuthorize("isAuthenticated()")
	@RequestMapping(value="/orderComplete", method = RequestMethod.GET)
	public void orderCompeleteGET(@RequestParam("orderid") String orderid, Model model) {
		
		model.addAttribute("orderid", orderid);
		
		model.addAttribute("orderItem", orderService.orderComplete(orderid));
		
		log.info("orderid = " + orderid);
		
	}
	
}