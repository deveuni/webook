package com.webook.persistence;

import java.util.List;

import com.webook.domain.CartListVO;
import com.webook.domain.CartVO;

public interface ShopDAO {
	
	/* 카트 담기 */
	public void addCart(CartVO cart) throws Exception;
	
	/* 카트 목록 */
	public List<CartListVO> cartList(String userId) throws Exception;
	
	/*  */
	/*  */
	/*  */

}
