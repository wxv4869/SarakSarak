package org.sarak.service;

import java.util.List;

import org.sarak.domain.CartDTO;
import org.springframework.stereotype.Service;

@Service
public interface CartService {
	
	public int insertCart(CartDTO cartDTO);
	
	public List<CartDTO> getCartList(String mid);
	
	public int deleteCart(int cartid);
	
	public int updateCount(CartDTO cartDTO);

}
