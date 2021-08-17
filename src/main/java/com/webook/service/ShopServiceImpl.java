package com.webook.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.webook.domain.CartListVO;
import com.webook.domain.CartVO;
import com.webook.persistence.ShopDAO;

@Service
public class ShopServiceImpl implements ShopService {

	/* DB를 처리하기 위한 객체 주입 */ 
	@Inject
	private ShopDAO sdao;
	
	private static final Logger log =
			LoggerFactory.getLogger(GoodsServiceImpl.class);

	/* 카트담기 */
	@Override
	public void addCart(CartVO cart) throws Exception {
		sdao.addCart(cart);
	}
	
	/* 카트 목록 */
	@Override
	public List<CartListVO> cartList(String userId) throws Exception {
		return sdao.cartList(userId);
	}
	
	/* 카트 삭제 */
	@Override
	public void deleteCart(CartVO cart) throws Exception {
		sdao.deleteCart(cart);
	}
	
	/*  */
	
}
