package org.sarak.mapper;

import java.time.LocalDate;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.sarak.domain.BookVO;
import org.sarak.domain.CartDTO;
import org.sarak.domain.Criteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class CartMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	private CartMapper cartMapper;
	
	// 장바구니 추가
//	@Test
//	public void testInsert() throws Exception {
//		
//		CartDTO cartDTO = new CartDTO();
//		
//		cartDTO.setMid("test1234");
//		cartDTO.setBid(2);
//		cartDTO.setCartquan(4);
//		
//		cartMapper.insertCart(cartDTO);
//		
//		log.info("insert 처리 결과 : " + cartDTO);
//		
//	}
	
	// 장바구니 삭제
//	@Test
//	public void testDelete() {
//		
//		int cartid = 2;
//		
//		cartMapper.deleteCart(cartid);
//		
//		log.info(cartid + " 삭제");
//		
//	}
	
	// 장바구니 수량 변경
//	@Test
//	public void testUpdate() {
//		
//		CartDTO cartDTO = new CartDTO();
//		
//		cartDTO.setCartid(13);
//		cartDTO.setCartquan(5);
//		
//		cartMapper.updateCart(cartDTO);
//		
//		log.info(cartDTO.getCartid() + "번 장바구니 수량 변경" + cartDTO);
//		
//	}
	
	// 장바구니 해당 상품 유무 확인
	@Test
	public void testCheckCart() {
		
		CartDTO cartDTO = new CartDTO();
		
		cartDTO.setMid("test1234");
		cartDTO.setBid(11);
		
		CartDTO resultCart = cartMapper.checkCart(cartDTO);
		
		log.info("checkCart 결과 : " + resultCart);
		
	}
	
	// 장바구니 목록
//	@Test
//	public void testGetCart() {
//		
//		String mid = "test1234";
//		
//		List<CartDTO> cartList = cartMapper.listCart(mid);
//		
//		for (CartDTO cart : cartList) {
//			
//			log.info(cart);
//			
//		}
//		
//	}

}
