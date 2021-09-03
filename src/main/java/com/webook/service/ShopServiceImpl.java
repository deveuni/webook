package com.webook.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.webook.domain.CartListVO;
import com.webook.domain.CartVO;
import com.webook.domain.Criteria;
import com.webook.domain.GoodsVO;
import com.webook.domain.OrderDetailVO;
import com.webook.domain.OrderListVO;
import com.webook.domain.OrderVO;
import com.webook.domain.ReplyListVO;
import com.webook.domain.ReplyVO;
import com.webook.persistence.ShopDAO;

@Service
public class ShopServiceImpl implements ShopService {

	/* DB를 처리하기 위한 객체 주입 */ 
	@Inject
	private ShopDAO dao;
	
	private static final Logger log =
			LoggerFactory.getLogger(AdminServiceImpl.class);

	/* 카테고리별 상품 목록 + 페이징처리 */
	@Override
	public List<GoodsVO> goodsCategoryList(String category, Criteria cri) throws Exception {

		System.out.println("S : 카테고리 분류");
		System.out.println("S : 카테고리 실행 ? " + dao.goodsCategoryList(category, cri));
		
		return dao.goodsCategoryList(category, cri);
	}
	
	/* 카테고리별 글 개수 가져오는 처리 */
	@Override
	public int CategoryCount(String category) throws Exception {
		
		int result = dao.CategoryCount(category);
		
		System.out.println("S : 카테고리글 개수 -> " + result);
		
		return result;
	}

	/* 상품 조회 */
	@Override
	public GoodsVO goodsDetail(int gdsNum) throws Exception {

		System.out.println("S : 상품 조회");
		return dao.goodsDetail(gdsNum);
	}
	
	/* 리뷰 작성 */
	@Override
	public void registReply(ReplyVO reply) throws Exception {
		dao.registReply(reply);
	}
	
	/* 리뷰 리스트 */
	@Override
	public List<ReplyListVO> replyList(int gdsNum) throws Exception {
		return dao.replyList(gdsNum);
	}
	
	/* 리뷰 삭제 */
	@Override
	public void deleteReply(ReplyVO reply) throws Exception {
		dao.deleteReply(reply);
	}
	
	/* 아이디 체크*/
	@Override
	public String idCheck(int repNum) throws Exception {
		return dao.idCheck(repNum);
	}
	
	
	/**/
	/**/
	
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
	
	/* 배송 상태 */
	/* 배송 상태 */
	@Override
	public void delivery(OrderVO order) throws Exception {
		dao.delivery(order);
	}	
	
	/*  */
	/*  */
	
}
