package org.sarak.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.security.Principal;
import java.util.List;

import org.sarak.domain.CartDTO;
import org.sarak.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/cart")
@Log4j
public class CartController {
	
	@Autowired
	private CartService cartService;
	
	// 장바구니 추가
	@PostMapping("/add")
	@ResponseBody
	public String addCartPost(@RequestParam("bookId") int bookId, @RequestParam("quantity") int quantity, Principal principal) {
		
		String username = principal.getName();
		
		CartDTO cartDTO = new CartDTO();
		
		cartDTO.setMid(username);
		
		cartDTO.setBid(bookId);
		
		cartDTO.setCartquan(quantity);
		
		int result = cartService.insertCart(cartDTO);
		
		return result + "";

	}
	
	// 장바구니 목록
	@GetMapping("/cartList")
	public String getCartList(Principal principal, Model model) {
		
		String username = principal.getName();
		
		List<CartDTO> cartList = cartService.getCartList(username);
		
		model.addAttribute("cartList", cartList);
		
		log.info(cartList);
		
		return "sarak/cartList";
		
	}
	 
	// 장바구니 삭제
	@RequestMapping(value = "/delete", method= {RequestMethod.GET, RequestMethod.POST})
	public String deleteCartPost(@RequestParam("cartid") int cartid, CartDTO cartDTO) {
		
		log.info("deleteCart " + cartid);
		
		cartService.deleteCart(cartid);
		
		return "redirect:/cart/cartList";
		
	}
	
	// 수량 변경
	@PostMapping("/update")
	public String updateCartPost(@RequestParam("cartid") int cartid, @RequestParam("quantity") int quantity, Principal principal) {
		
		String username = principal.getName();
		
		CartDTO cart = new CartDTO();
		
		cart.setMid(username);
		
		cart.setCartid(cartid);
		
		cart.setCartquan(quantity);
		
		cartService.updateCount(cart);
		
		return "redirect:/cart/cartList";
		
	}
	
	// 장바구니 도서 표지 이미지
	@GetMapping("/display")
	@ResponseBody
	public ResponseEntity<byte[]> getFile(String filename) {
		
		File file = new File("C:\\saraksarak\\" + filename);
		
		ResponseEntity<byte[]> result = null;
		
		try {
			
			HttpHeaders header = new HttpHeaders();
			
			header.add("Content-Type", Files.probeContentType(file.toPath()));
			
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
			
		} catch (IOException e) {
			
			e.printStackTrace();
			
		}
		
		return result;
		
	}

}
