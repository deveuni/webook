package com.webook.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.webook.domain.Criteria;
import com.webook.domain.GoodsVO;
import com.webook.domain.OrderListVO;
import com.webook.domain.OrderVO;
import com.webook.domain.ReplyListVO;
import com.webook.persistence.AdminDAO;

@Service
public class AdminServiceImpl implements AdminService {
	
	/* DB를 처리하기 위한 객체 주입 */ 
	@Inject
	private AdminDAO dao;
	
	private static final Logger log =
			LoggerFactory.getLogger(AdminServiceImpl.class);

	/* 상품 등록 */
	@Override
	public void goodsRegister(GoodsVO vo) throws Exception {
		
		dao.registerGoods(vo);
		
		System.out.println("S : 상품등록 " + vo);
	}
	
	/* 상품 목록 */
	@Override
	public List<GoodsVO> goodsList() throws Exception {

		System.out.println("S : 상품 목록 ");
		
		return dao.goodsList();
	}	
	
	
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
	
	/* 상품 수정 */
	@Override
	public void goodsModify(GoodsVO vo) throws Exception {

		System.out.println("S : 상품 수정");
		dao.goodsModify(vo);
		System.out.println("S : 수정된 상품 정보 -> " + vo);
		
	}
	
	/* 상품 삭제 */
	@Override
	public void goodsDelete(int gdsNum) throws Exception {

		System.out.println("S : 상품 삭제");
		dao.goodsDelete(gdsNum);
	}
	
	
	/* 모든 유저 주문 목록 */
	@Override
	public List<OrderVO> orderList() throws Exception {
		return dao.orderList();
	}
	
	/* 특정 주문 목록 */
	@Override
	public List<OrderListVO> orderView(OrderVO order) throws Exception {
		return dao.orderView(order);
	}
	
	/* 배송 상태 */
	@Override
	public void delivery(OrderVO order) throws Exception {
		dao.delivery(order);
	}
	
	/* 상품 수량 조절 */
	@Override
	public void changeStock(GoodsVO goods) throws Exception {
		dao.changeStock(goods);
	}
	
	/* 모든 상품 리뷰 */
	@Override
	public List<ReplyListVO> allReply() throws Exception {
		return dao.allReply();
	}
	
	/* 상품 리뷰 삭제 */
	@Override
	public void deleteReply(int repNum) throws Exception {
		dao.deleteReply(repNum);
	}
	
	/**/
	/**/
	
	
	
}
