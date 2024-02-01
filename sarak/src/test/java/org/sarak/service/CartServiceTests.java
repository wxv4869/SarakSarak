package org.sarak.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.sarak.domain.CartDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class CartServiceTests {
	
	@Setter(onMethod_ = {@Autowired})
	private CartService cartService;
	
	// 장바구니 등록
//	@Test
//	public void addCartTest() {
//		
//		// DB에 등록되어 있는 값 insert 시도 : 2 반환
//		// DB에 등록되지 않은 값 insert 시도 : 1 반환 & DB 등록 처리
//		// SQL 에러를 발생시킬 값 insert 시도 (존재하지 않는 mid 입력) : 0 반환
//		
//		String mid = "test1234";
//		int bid = 5;
//		int cartquan = 6;
//			
//		CartDTO cartDTO = new CartDTO(); 
//		cartDTO.setMid(mid);
//		cartDTO.setBid(bid);
//		cartDTO.setCartquan(cartquan);
//		
//		int result = cartService.insertCart(cartDTO);
//		
//		log.info("########## insert result : " + result);
//		
//	}
	
	// 장바구니 삭제
//	@Test
//	public void deleteCartTest() {
//		
//		int cartid = 15;
//		
//		int result = cartService.deleteCart(cartid);
//		
//		log.info("########## delete result : " + result);
//		
//	}

}
