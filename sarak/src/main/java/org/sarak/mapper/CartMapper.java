package org.sarak.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.sarak.domain.CartDTO;

@Mapper
public interface CartMapper {
	
	public int insertCart(CartDTO cartDTO) throws Exception;
	
	public List<CartDTO> listCart(String mid);
	
	public CartDTO readmap(int cartid);
	
	public int deleteCart(int cartid);
	
	public CartDTO checkCart(CartDTO cartDTO);
	
	public int updateCart(CartDTO cartDTO);
	
	public void deleteOrderCart(CartDTO dto);
	
	public void deleteALlCartByMid(String mid);

}
