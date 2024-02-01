package org.sarak.service;

import java.util.List;

import org.sarak.domain.CartDTO;
import org.sarak.mapper.CartMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class CartServiceImpl implements CartService {
	
	@Setter(onMethod_ = @Autowired)
	private CartMapper cartMapper;

	@Override
	public int insertCart(CartDTO cart) {
		
		CartDTO existingCart = cartMapper.checkCart(cart);    // DB에 해당 도서가
		
		if (existingCart != null) {    // 존재한다면
			
			int newQuantity = existingCart.getCartquan() + cart.getCartquan();    // 원래의 cartquan과 새로 들어온 데이터의 cartquan을 합산하여
			
			existingCart.setCartquan(newQuantity);    // 저장
			
			try {
				
				cartMapper.updateCart(existingCart);    // newQuantity 원래의 데이터 행에서 수량만 update
			
			} catch (Exception e) {
				
				return 0;    // 예외 발생 (DB 등록 실패) '0' 반환
				
			}
			
		} else {    // 존재하지 않는다면
			
			try {
	            
	            cartMapper.insertCart(cart);    // 걍 새로운 행 insert
	        
	        } catch (Exception e) {
	            
	            return 0;  // 예외 발생 (DB 등록 실패) 시 '0' 반환
	            
	        }
			
		}

	    return 1;    // 성공적으로 처리 시 '1' 반환
	    
	}
	
	@Override
	public List<CartDTO> getCartList(String mid) {
		
		List<CartDTO> cartList = cartMapper.listCart(mid);
		
		return cartList;
		
	}
	
	@Override
	public int deleteCart(int cartid) {
		
		return cartMapper.deleteCart(cartid);
		
	}

	@Override
	public int updateCount(CartDTO cartDTO) {

		return cartMapper.updateCart(cartDTO);
		
	}

}
