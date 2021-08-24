package com.webook.service;

import java.util.List;

import com.webook.domain.CartListVO;
import com.webook.domain.CartVO;
import com.webook.domain.OrderDetailVO;
import com.webook.domain.OrderVO;

public interface ShopService {

	/* 카트담기 */
	public void addCart(CartVO cart) throws Exception;
	
	/* 카트 목록 */
	public List<CartListVO> cartList(String userId) throws Exception;
	
	/* 카트 삭제 */
	public void deleteCart(CartVO cart) throws Exception;
	
	/* 주문 정보 */
	public void orderInfo(OrderVO order) throws Exception;
	
	/* 주문 상세 정보 */
	public void orderInfo_Details(OrderDetailVO orderDetail) throws Exception;
	
	
	/*  */
	/*  */
	
}
