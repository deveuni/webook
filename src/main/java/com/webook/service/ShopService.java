package com.webook.service;

import java.util.List;

import com.webook.domain.CartListVO;
import com.webook.domain.CartVO;
import com.webook.domain.Criteria;
import com.webook.domain.GoodsVO;
import com.webook.domain.OrderDetailVO;
import com.webook.domain.OrderListVO;
import com.webook.domain.OrderVO;
import com.webook.domain.ReplyListVO;
import com.webook.domain.ReplyVO;

public interface ShopService {
	
	/* 카테고리별 상품 목록 + 페이징 처리 */
	public List<GoodsVO> goodsCategoryList(String category, Criteria cri) throws Exception;
	
	/* 카테고리별 글 개수 가져오는 처리 */
	public int CategoryCount(String category) throws Exception;
	
	/* 상품 조회 */
	public GoodsVO goodsDetail(int gdsNum) throws Exception;

	/* 리뷰 작성 */
	public void registReply(ReplyVO reply) throws Exception;
	
	/* 리뷰 리스트 */
	public List<ReplyListVO> replyList(int gdsNum) throws Exception;
	
	/* 리뷰 삭제 */
	public void deleteReply(ReplyVO reply) throws Exception;
	
	/* 아이디 체크 */
	public String idCheck(int repNum) throws Exception;
	
	
	/**/
	
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
	
	/* 카트 비우기 */
	public void cartAllDelete(String userId) throws Exception;
	
	/* 주문 목록 */
	public List<OrderVO> orderList(OrderVO order) throws Exception;
	
	/* 특정 주문 목록 */
	public List<OrderListVO> orderView(OrderVO order) throws Exception;
	
	/* 배송 상태 */
	public void delivery(OrderVO order) throws Exception;
	
	/*  */
	
}
