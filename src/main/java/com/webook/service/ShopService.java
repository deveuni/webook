package com.webook.service;

import java.util.List;

import com.webook.domain.CartListVO;
import com.webook.domain.CartVO;

public interface ShopService {

	/* 카트담기 */
	public void addCart(CartVO cart) throws Exception;
	
	/* 카트 목록 */
	public List<CartListVO> cartList(String userId) throws Exception;
	
	/* 카트 삭제 */
	public void deleteCart(CartVO cart) throws Exception;
	
	/*  */
	
}
