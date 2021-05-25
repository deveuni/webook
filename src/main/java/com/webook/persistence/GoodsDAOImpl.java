package com.webook.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.webook.domain.GoodsVO;

@Repository
public class GoodsDAOImpl implements GoodsDAO {
	
	/* DB 연결하는 객체 주입 */
	@Inject
	private SqlSession sql;
	
	/* Mapper를 구분하는 값 */
	private static final String namespace
		= "com.webook.mapper.GoodsMapper";
	
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
	
	/* 상품 조회 */
	@Override
	public GoodsVO goodsDetail(int gdsNum) throws Exception {
		
		return sql.selectOne(namespace + ".goodsDetail", gdsNum);
	}
	
	/**/

}
