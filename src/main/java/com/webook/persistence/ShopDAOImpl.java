package com.webook.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.webook.domain.CartListVO;
import com.webook.domain.CartVO;
import com.webook.domain.OrderDetailVO;
import com.webook.domain.OrderVO;

@Repository
public class ShopDAOImpl implements ShopDAO {
	
	/* DB 연결하는 객체 주입 */
	@Inject
	private SqlSession sql;
	
	/* Mapper를 구분하는 값 */
	private static final String namespace
		= "com.webook.mapper.ShopMapper";
	

	/* 카트 담기 */
	@Override
	public void addCart(CartVO cart) throws Exception {
		sql.insert(namespace + ".addCart", cart);
	}
	
	/* 카트 목록 */
	@Override
	public List<CartListVO> cartList(String userId) throws Exception {
		return sql.selectList(namespace + ".cartList", userId);
	}
	
	/* 카트 삭제 */
	@Override
	public void deleteCart(CartVO cart) throws Exception {
		sql.delete(namespace + ".deleteCart", cart);
	}
	
	/* 주문 정보 */
	@Override
	public void orderInfo(OrderVO order) throws Exception {
		sql.insert(namespace + ".orderInfo", order);
	}
	
	/* 주문 상세 정보 */
	@Override
	public void orderInfo_Details(OrderDetailVO orderDetail) throws Exception {
		sql.insert(namespace + ".orderInfo_Details", orderDetail);
	}
	
	/* 카트 비우기 */
	@Override
	public void cartAllDelete(String userId) throws Exception {
		sql.delete(namespace + ".cartAllDelete", userId);
	}
	
	/* 주문 목록 */
	@Override
	public List<OrderVO> orderList(OrderVO order) throws Exception {
		return sql.selectList(namespace + ".orderList", order);
	}
	
	/*  */
	
	
}
