package com.webook.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.webook.domain.CartListVO;
import com.webook.domain.CartVO;
import com.webook.domain.OrderDetailVO;
import com.webook.domain.OrderListVO;
import com.webook.domain.OrderVO;
import com.webook.persistence.ShopDAO;

@Service
public class ShopServiceImpl implements ShopService {

	/* DB를 처리하기 위한 객체 주입 */ 
	@Inject
	private ShopDAO dao;
	
	private static final Logger log =
			LoggerFactory.getLogger(GoodsServiceImpl.class);

	/* 카트담기 */
	@Override
	public void addCart(CartVO cart) throws Exception {
		dao.addCart(cart);
	}
	
	/* 카트 목록 */
	@Override
	public List<CartListVO> cartList(String userId) throws Exception {
		return dao.cartList(userId);
	}
	
	/* 카트 삭제 */
	@Override
	public void deleteCart(CartVO cart) throws Exception {
		dao.deleteCart(cart);
	}
	
	/* 주문 정보 */
	@Override
	public void orderInfo(OrderVO order) throws Exception {
		dao.orderInfo(order);
	}
	
	/* 주문 상세 정보 */
	@Override
	public void orderInfo_Details(OrderDetailVO orderDetail) throws Exception {
		dao.orderInfo_Details(orderDetail);
	}
	
	/* 카트 비우기 */
	@Override
	public void cartAllDelete(String userId) throws Exception {
		dao.cartAllDelete(userId);
	}
	
	/* 주문 목록 */
	@Override
	public List<OrderVO> orderList(OrderVO order) throws Exception {
		return dao.orderList(order);
	}
	
	/* 특정 주문 목록 */
	@Override
	public List<OrderListVO> orderView(OrderVO order) throws Exception {
		return dao.orderView(order);
	}
	
	/*  */
	/*  */
	/*  */
	
}
