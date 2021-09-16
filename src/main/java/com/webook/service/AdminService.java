package com.webook.service;

import java.util.List;

import com.webook.domain.Criteria;
import com.webook.domain.GoodsVO;
import com.webook.domain.OrderListVO;
import com.webook.domain.OrderVO;

public interface AdminService {
	
	/* 상품 등록 */
	public void goodsRegister(GoodsVO vo) throws Exception;
	
	/* 상품 목록 */
	public List<GoodsVO> goodsList() throws Exception; 
	
	/* 카테고리별 상품 목록 + 페이징 처리 */
	public List<GoodsVO> goodsCategoryList(String category, Criteria cri) throws Exception;
	
	/* 카테고리별 글 개수 가져오는 처리 */
	public int CategoryCount(String category) throws Exception;
	
	/* 상품 조회 */
	public GoodsVO goodsDetail(int gdsNum) throws Exception;
	
	/* 상품 수정 */
	public void goodsModify(GoodsVO vo) throws Exception;
	
	/* 상품 삭제 */
	public void goodsDelete(int gdsNum) throws Exception;
	
	/* 주문 목록 */
	public List<OrderVO> orderList() throws Exception;
	
	/* 특정 주문 목록 */
	public List<OrderListVO> orderView(OrderVO order) throws Exception;
	
	/* 배송 상태 */
	public void delivery(OrderVO order) throws Exception;
	
	/* 상품 수량 조절 */
	public void changeStock(GoodsVO goods) throws Exception;
	
	/**/
	/**/
	/**/

}
