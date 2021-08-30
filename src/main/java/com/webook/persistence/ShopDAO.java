package com.webook.persistence;

import java.util.List;

import com.webook.domain.CartListVO;
import com.webook.domain.CartVO;
import com.webook.domain.OrderDetailVO;
import com.webook.domain.OrderListVO;
import com.webook.domain.OrderVO;

public interface ShopDAO {
	
	/* 카트 담기 */
	public void addCart(CartVO cart) throws Exception;
	
	/* 카트 목록 */
	public List<CartListVO> cartList(String userId) throws Exception;
	
	/* 카트 삭제 */
	public void deleteCart(CartVO cart) throws Exception;
	
	/* 주문 정보 */
	public void orderInfo(OrderVO order) throws Exception;
	
	/* 주문 상세 정보 */
	public void orderInfo_Details(OrderDetailVO orderDetail) throws Exception;
	
	/* 카트 비우기 */
	public void cartAllDelete(String userId) throws Exception;
	
	/* 주문 목록 */
	public List<OrderVO> orderList(OrderVO order) throws Exception;
	
	/* 특정 주문 목록 */
	public List<OrderListVO> orderView(OrderVO order) throws Exception;
	
	/* 배송 상태 */
	public void delivery(OrderVO order) throws Exception;
	
	/*  */
	/*  */

}
