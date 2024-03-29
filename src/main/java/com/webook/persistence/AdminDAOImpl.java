package com.webook.persistence;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.webook.domain.Criteria;
import com.webook.domain.GoodsVO;
import com.webook.domain.OrderListVO;
import com.webook.domain.OrderVO;
import com.webook.domain.ReplyListVO;

@Repository
public class AdminDAOImpl implements AdminDAO {
	
	/* DB 연결하는 객체 주입 */
	@Inject
	private SqlSession sql;
	
	/* Mapper를 구분하는 값 */
	private static final String namespace
		= "com.webook.mapper.adminMapper";
	
	/* 상품 등록 */
	@Override
	public void registerGoods(GoodsVO vo) throws Exception {
		
		System.out.println("DAO : 상품등록" + vo);
		sql.insert(namespace + ".register", vo);
		
	}
	
	/* 상품 목록 */
	@Override
	public List<GoodsVO> goodsList() throws Exception {

		return sql.selectList(namespace + ".goodsList");
	}
	
	
	/* 카테고리별 상품목록 + 페이징처리 */
	@Override
	public List<GoodsVO> goodsCategoryList(String category, Criteria cri) throws Exception {

		System.out.println("DAO : 카테고리 분류");
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("category", category);
		map.put("cri", cri);
		
		return sql.selectList(namespace + ".category", map);
	}
	
	/* 카테고리별 상품 개수 가져오는 처리 */
	@Override
	public int CategoryCount(String category) throws Exception {
		
		int result = sql.selectOne(namespace + ".categoryCount", category);
		
		System.out.println("DAO : 카테고리글 개수 -> " + result);
		return result;
	}
	
	/* 상품 조회 */
	@Override
	public GoodsVO goodsDetail(int gdsNum) throws Exception {
		
		return sql.selectOne(namespace + ".goodsDetail", gdsNum);
	}
	
	/* 상품 수정 */
	@Override
	public void goodsModify(GoodsVO vo) throws Exception {
		System.out.println("DAO : 상품 수정");
		sql.update(namespace + ".goodsModify", vo);
		System.out.println("DAP : 수정된 상품 정보 -> " + vo);
	}
	
	/* 상품 삭제 */
	@Override
	public void goodsDelete(int gdsNum) throws Exception {
		System.out.println("DAO : 상품 삭제");
		sql.delete(namespace + ".goodsDelete", gdsNum);
	}
	
	
	/* 모든 유저 주문 목록 */
	@Override
	public List<OrderVO> orderList() throws Exception {
		return sql.selectList(namespace + ".orderList");
	}
	
	/* 특정 주문 목록 */
	@Override
	public List<OrderListVO> orderView(OrderVO order) throws Exception {
		return sql.selectList(namespace + ".orderView", order);
	}
	
	/* 배송 상태 */
	@Override
	public void delivery(OrderVO order) throws Exception {
		sql.update(namespace + ".delivery", order);
	}
	
	/* 상품 수량 조절 */
	@Override
	public void changeStock(GoodsVO goods) throws Exception {
		sql.update(namespace + ".changeStock", goods);
	}
	
	/* 모든 상품 리뷰 */
	@Override
	public List<ReplyListVO> allReply() throws Exception {
		return sql.selectList(namespace + ".allReply");
	}
	
	/* 상품 리뷰 삭제 */
	@Override
	public void deleteReply(int repNum) throws Exception {
		sql.delete(namespace + ".deleteReply", repNum);
	}
	
	/**/

}
