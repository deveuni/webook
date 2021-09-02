package com.webook.persistence;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.webook.domain.Criteria;
import com.webook.domain.GoodsVO;

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
	
	
	/**/
	/**/

}
